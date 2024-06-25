import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tadrebk/add_training/model.dart';
import 'package:tadrebk/add_training/states.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PostCubit extends Cubit<PostStatus> {
  PostCubit() : super(InitialStates());

  static PostCubit get(context) => BlocProvider.of(context);

  Uint8List? postImage;
  var picker = ImagePicker();

  // استعادة صورة المنشور من معرض الصور
  Future<void> getPostImage() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      postImage = await pickedFile.readAsBytes();
      emit(PostPickerSuccessState());
      print('Image selected');
    } else {
      print('No Image Selected!');
      emit(PostPickerErrorState());
    }
  }

  // إزالة صورة المنشور المحددة
  void removePostImage() {
    postImage = null;
    emit(RemovePostImageState());
  }

  // تحميل المنشور إلى قاعدة بيانات Firebase وتخزين الصورة في Firebase Storage
  void uploadPost({
    required String companyName,
    required String trainingName,
    required String category,
    required String city,
    required String street,
    required String trainingSpecialization,
    required String trainingCost,
    required String trainingDescription,
    required String startDate,
    required String endDate,
    required BuildContext context,
  }) {
    emit(CreatePostLoadingState());

    // تحديد مسار تخزين الصورة في Firebase Storage
    final firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("posts/${DateTime.now().millisecondsSinceEpoch}.jpg");

    // رفع الصورة إلى Firebase Storage
    final firebase_storage.UploadTask uploadTask =
    storageRef.putData(postImage!);

    // معالجة نتيجة رفع الصورة
    uploadTask.then((firebase_storage.TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((downloadURL) {
        print('File available at: $downloadURL');

        // إنشاء المنشور في قاعدة بيانات Firestore بعد الحصول على رابط الصورة
        createPost(
          image: downloadURL,
          companyName: companyName,
          category: category,
          trainingName: trainingName,
          city: city,
          street: street,
          trainingSpecialization: trainingSpecialization,
          trainingCost: trainingCost,
          trainingDescription: trainingDescription,
          startDate: startDate,
          endDate: endDate,
        );
      }).catchError((onError) {
        print('Upload error: $onError');
        emit(CreatePostErrorState());
      });
    }).catchError((onError) {
      print('No image selected!');
      emit(CreatePostErrorState());
    });
  }

  // إنشاء منشور جديد في قاعدة بيانات Firestore
  void createPost({
    required String image,
    required String companyName,
    required String city,
    required String street,
    required String trainingSpecialization,
    required String trainingCost,
    required String trainingDescription,
    required String startDate,
    required String endDate,
    required String trainingName,
    required String category,
  }) {
    PostModel model = PostModel(
      isLiked: 'false',
      uId: '',
      companyUid: FirebaseAuth.instance.currentUser!.uid,
      image: image,
      companyName: companyName,
      category: category,
      trainingName: trainingName,
      city: city,
      street: street,
      trainingSpecialization: trainingSpecialization,
      trainingCost: trainingCost,
      trainingDescription: trainingDescription,
      startDate: startDate,
      endDate: endDate,
      isPaid: 'false',
      paymentUid: '',
    );

    // إضافة المنشور إلى Firestore
    FirebaseFirestore.instance.collection("posts").add(model.toMap()).then(
          (DocumentReference documentReference) {
        // تحديث المنشور بمعرف الوثيقة الجديدة
        updatePost(
          image: image,
          companyName: companyName,
          category: category,
          trainingName: trainingName,
          city: city,
          street: street,
          trainingSpecialization: trainingSpecialization,
          trainingCost: trainingCost,
          trainingDescription: trainingDescription,
          startDate: startDate,
          endDate: endDate,
          id: documentReference.id,
        );

        emit(CreatePostSuccessState());
      },
    ).catchError((e) {
      emit(CreatePostErrorState());
    });
  }

  // تحديث المنشور في قاعدة بيانات Firestore
  Future<void> updatePost({
    required String image,
    required String companyName,
    required String city,
    required String street,
    required String trainingSpecialization,
    required String trainingCost,
    required String trainingDescription,
    required String startDate,
    required String endDate,
    required String trainingName,
    required String category,
    required String id,
    String? isLiked,
    String? isPaid,
    String? paymentUid,
  }) async {
    PostModel model = PostModel(
      isLiked: isLiked ?? 'false',
      companyUid: FirebaseAuth.instance.currentUser!.uid,
      isPaid: isPaid ?? 'false',
      paymentUid: FirebaseAuth.instance.currentUser!.uid,
      uId: id,
      image: image,
      companyName: companyName,
      category: category,
      trainingName: trainingName,
      city: city,
      street: street,
      trainingSpecialization: trainingSpecialization,
      trainingCost: trainingCost,
      trainingDescription: trainingDescription,
      startDate: startDate,
      endDate: endDate,
    );

    // تحديث المنشور باستخدام معرف الوثيقة
    FirebaseFirestore.instance.collection("posts").doc(id).update(
      model.toMap(),
    ).then(
          (value) {
        emit(UpdatePostSuccessState());
      },
    ).catchError((e) {
      emit(UpdatePostErrorState());
    });
  }

  // استرجاع عدد الدورات حسب الفئة من قاعدة بيانات Firestore
  Future<Map<String, int>> countCoursesByCategory() async {
    final QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('posts').get();

    final Map<String, int> courseCounts = {};

    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;

      // التحقق مما إذا كانت 'category' قائمة أو قيمة واحدة
      if (data['category'] is List<dynamic>) {
        final categories = data['category'] as List<dynamic>;
        categories.forEach((category) {
          courseCounts[category] = (courseCounts[category] ?? 0) + 1;
        });
      } else if (data['category'] is String) {
        final category = data['category'] as String;
        courseCounts[category] = (courseCounts[category] ?? 0) + 1;
      }
    });

    return courseCounts;
  }
}
