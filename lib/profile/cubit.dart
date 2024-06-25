

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadrebk/profile/company_model.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/profile/user_model.dart';
import 'package:tadrebk/shared/cach_helper.dart';

class ProfileCubit extends Cubit<ProfileStatus> {
  ProfileCubit() : super(ProfileInitialStates());
  static ProfileCubit get(context) => BlocProvider.of(context);

   UserModel? userModel;
  Future<void> getUserData()
  async {

        emit(ProfileGetUserLoadingStates());
    final uId = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel=UserModel.fromJson(value.data()!);
      print(userModel!.uId);
      emit(ProfileGetUserSuccessStates());
    }).catchError((e){
      emit(ProfileGetUserErrorStates());
    });
  }


  CompanyModel? companyModel;
  Future<void> getCompanyData()
  async {
    emit(ProfileGetCompanyLoadingStates());
    final uId = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection('companies').doc(uId).get().then((value) {
      companyModel=CompanyModel.fromJson(value.data()!);
      print(companyModel!.uId);

      emit(ProfileGetCompanySuccessStates());
    }).catchError((e){
      emit(ProfileGetCompanyErrorStates());
    });


  }

 void resetUserAndCompanyData() {
    userModel = null;
    companyModel = null;
  }

  bool isDark = cachHelper.getData(key: 'isDark') ?? false;

  void changeStyle(){

    isDark =! isDark;

    cachHelper.saveData(key: 'isDark', value: isDark);

    emit(ChangeStyleSuccessStates());
  }

}