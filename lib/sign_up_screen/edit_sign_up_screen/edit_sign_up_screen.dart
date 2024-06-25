// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:tadrebk/profile/cubit.dart';
// import 'package:tadrebk/profile/states.dart';
// import 'package:tadrebk/sign_up_screen/sign_up_model.dart';
//
// class EditAccountScreen extends StatefulWidget {
//   final UserModel userModel;
//
//   const EditAccountScreen({Key? key, required this.userModel}) : super(key: key);
//
//   @override
//   _EditAccountScreenState createState() => _EditAccountScreenState();
// }
//
// class _EditAccountScreenState extends State<EditAccountScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController streetController = TextEditingController();
//   final TextEditingController companyNameController = TextEditingController();
//   bool isPerson = true;
//   File? _image;
//
//   @override
//   void initState() {
//     super.initState();
//     emailController.text = widget.userModel.email ?? '';
//     firstNameController.text = widget.userModel.firstName ?? '';
//     lastNameController.text = widget.userModel.lastName ?? '';
//     phoneNumberController.text = widget.userModel.phoneNumber ?? '';
//     cityController.text = widget.userModel.city ?? '';
//     streetController.text = widget.userModel.street ?? '';
//     isPerson = widget.userModel.isPerson == "true"; // Assuming "isPerson" is stored as a string representation of boolean
//   }
//
//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }
//
//   Future<String?> _uploadImage(File image) async {
//     try {
//       final storageReference = FirebaseStorage.instance.ref().child('users/${widget.userModel.uId}/profile.jpg');
//       final uploadTask = storageReference.putFile(image);
//       final taskSnapshot = await uploadTask;
//       return await taskSnapshot.ref.getDownloadURL();
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }
//
//   void _saveChanges() async {
//     if (_formKey.currentState!.validate()) {
//       String? imageUrl;
//       if (_image != null) {
//         imageUrl = await _uploadImage(_image!);
//       }
//       final updatedUser = UserModel(
//         firstName: firstNameController.text,
//         lastName: lastNameController.text,
//         phoneNumber: phoneNumberController.text,
//         city: cityController.text,
//         street: streetController.text,
//         isPerson: isPerson.toString(), // Convert boolean to string
//         email: emailController.text,
//         uId: widget.userModel.uId,
//         image: imageUrl ?? widget.userModel.image,
//         isEmailVerified: widget.userModel.isEmailVerified,
//       );
//       // Now you can use the updatedUser object to save changes or perform any other operations.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Account Settings'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // Your form fields here
//               ElevatedButton(
//                 onPressed: _saveChanges,
//                 child: Text('Save Changes'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
