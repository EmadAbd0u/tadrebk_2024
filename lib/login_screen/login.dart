import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/login_screen/cubit.dart';
import 'package:tadrebk/login_screen/state.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/fonts.dart';
import '../forget_password/forget_password.dart';
import '../profile/cubit.dart';
import '../profile/user_model.dart';
import '../sign_up_screen/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorStates) {
          showToast(
              msg: 'Email or Password not true, please try again.',
              state: ToastStates.ERORR);

          // cachHelper.saveData(key: 'token', value: false);
        } else if (state is LoginSuccessStates) {
          showToast(msg: 'Welcome!', state: ToastStates.SUCCESS);

          cachHelper.saveData(key: 'uId', value: state.uId).then((value) {
            ProfileCubit.get(context).getUserData();
            ProfileCubit.get(context).getCompanyData();
            UserModel? userModel;

            final uId = FirebaseAuth.instance.currentUser?.uid;
            FirebaseFirestore.instance
                .collection('users')
                .doc(uId)
                .get()
                .then((value) {
              userModel = UserModel.fromJson(value.data()!);

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
              cachHelper.saveData(key: 'type', value: 'person');
            }).catchError((e) {
              print("is company${e.toString()}");
            });
            FirebaseFirestore.instance
                .collection('companies')
                .doc(uId)
                .get()
                .then((value) {
              userModel = UserModel.fromJson(value.data()!);

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
              cachHelper.saveData(key: 'type', value: 'company');
            }).catchError((e) {
              print("is person${e.toString()}");
            });
          }).catchError((error) {
            print(error.toString());
          });
        }
      },
      builder: (context, state) {
        final windowWidth = MediaQuery.of(context).size.width;
        final windowHeight = MediaQuery.of(context).size.height;

        return windowWidth >= 1100 && windowHeight >= 600
            ? Form(
                key: _formKey,
                child: Scaffold(
                  backgroundColor: Colors.black,
                  body: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Opacity(
                          opacity: 0.7,
                          child: Image.asset(
                            'assets/images/img_15.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.16,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/img_14.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.14,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 50 ,right: 50,),
                                                  child: LocaleText(
                                                    'login',
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: mainFont),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.14,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10, top: 10),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Navigator.pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      HomePage()),
                                                          (route) => false);
                                                    },
                                                    icon: Icon(Icons.close),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30, top: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LocaleText(
                                            'enter_address',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: mainFont,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(height: 4,),
                                          TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: emailController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Email Address',
                                              hintStyle: TextStyle(
                                               color: Colors.grey,
                                               fontSize: 15),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                             Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30, top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LocaleText(
                                            'enter_password',
                                            style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: mainFont,
                                            color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            controller: passwordController,
                                            obscureText: LoginCubit.get(context)
                                                .isNotVisible,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Password',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    LoginCubit.get(context)
                                                        .changePasswordVisibility();
                                                  },
                                                  child: Icon(
                                                    LoginCubit.get(context)
                                                        .suffix,
                                                    color: Colors.grey,
                                                    size: 16,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30, top: 30),
                                      child: InkWell(
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            LoginCubit.get(context).userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                context: context);
                                          }
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                HexColor('#1B3358'),
                                                mainColor
                                              ],
                                            ),
                                          ),
                                          child: Center(
                                            child: LocaleText(
                                              'login',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 6,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Checkbox(
                                            value: isChecked,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked = !isChecked;
                                              });
                                            },
                                          ),
                                          Expanded(
                                            child: LocaleText(
                                              'remember_me',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: mainFont,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return ForgetPassword();
                                              }));
                                            },
                                            child: LocaleText(
                                              'forget_your_password',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: mainFont,
                                                color: mainColor,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: mainColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 40,
                                      ),
                                      child: Row(
                                        children: [
                                          LocaleText(
                                            'have_account',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: mainFont,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignUp()),
                                                  (route) => false);
                                            },
                                            child: LocaleText(
                                              'sign_up',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: mainFont,
                                                fontWeight: FontWeight.w600,
                                                color: mainColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
