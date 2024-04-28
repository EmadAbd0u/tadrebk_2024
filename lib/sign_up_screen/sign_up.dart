import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/constant.dart';
import 'package:tadrebk/sign_up_screen/state.dart';

import '../login_screen/login.dart';
import '../profile/cubit.dart';
import '../shared/fonts.dart';

import 'cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPerson = true;

  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterCreateUserSuccessStates) {
          cachHelper.saveData(key: 'uId', value: state.uId);

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => const HomePage()), (
                  route) => false);
          cachHelper.saveData(key: 'type', value: 'person');

          typeInter = isPerson.toString();

          ProfileCubit.get(context).getUserData();
        } else if (state is RegisterCreateCompanySuccessStates) {
          cachHelper.saveData(key: 'uId', value: state.uId);

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => const HomePage()), (
                  route) => false);
          cachHelper.saveData(key: 'type', value: 'company');

          typeInter = isPerson.toString();

          ProfileCubit.get(context).getUserData();
        }
        else {
          showToast(
              msg: 'check your network.',
              state: ToastStates.ERORR
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Scaffold(
            body: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Row(
                children: [
                  Image.asset(
                    isPerson
                        ? 'assets/images/img_16.png'
                        : 'assets/images/img_17.png',
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.3,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    fit: BoxFit.cover,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,

                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // تحديد توجيه العناصر
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    isPerson
                                        ? 'Create Account as Person'
                                        : 'Create Account as Company',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: mainFont,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: mainFont,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (
                                            context) => const Login()), (
                                            route) => false);
                                  },
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.08,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: mainColor, // Outline color
                                        width: 1, // Outline width
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.3,

                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: mainColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPerson = true;
                                            });
                                          },
                                          child: Container(
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.06,
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius
                                                  .horizontal(
                                                  left: Radius.circular(20)),
                                              color: isPerson
                                                  ? mainColor
                                                  : Colors.white,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Person',
                                                style: TextStyle(
                                                  color: isPerson
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPerson = false;
                                            });
                                          },
                                          child: Container(
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.06,
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius
                                                  .horizontal(
                                                  right: Radius.circular(20)),
                                              color: isPerson
                                                  ? Theme
                                                  .of(context)
                                                  .scaffoldBackgroundColor
                                                  : mainColor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Company',
                                                style: TextStyle(
                                                  color: isPerson
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(

                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.05,
                                ),
                                isPerson ? Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text('First Name*',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: mainFont,
                                              color: Colors.grey
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.14,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.06,
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            controller: firstNameController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Name',

                                              hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius
                                                    .all(Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius
                                                    .all(Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius
                                                    .all(Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius
                                                    .all(Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text('Last Name*',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: mainFont,
                                              color: Colors.grey
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.14,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.06,
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            controller: lastNameController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Last Name',

                                              hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius
                                                    .all(Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius
                                                    .all(Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius
                                                    .all(Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius
                                                    .all(Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ) : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Company Name*',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: mainFont,
                                          color: Colors.grey
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.06,
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        controller: companyNameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'this field is empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Enter Name Of Company',

                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          focusColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email Address*',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: mainFont,
                                          color: Colors.grey
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.06,
                                      child: TextFormField(
                                        keyboardType: TextInputType
                                            .emailAddress,
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'this field is empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Name@gmail.com',

                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          focusColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Password*',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: mainFont,
                                          color: Colors.grey
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.06,
                                      child: defaultFormField(
                                        context: context,
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        validate: defaultFormFieldValidator
                                            .password,
                                        // استخدام الوظيفة للتحقق من صحة كلمة المرور
                                        hintText: 'Enter your password',
                                        prefix: Icons.lock,
                                        suffix: RegisterCubit
                                            .get(context)
                                            .suffix,
                                        obscureText: RegisterCubit
                                            .get(context)
                                            .isNotVisible,
                                        suffixPressed: () {
                                          RegisterCubit.get(context)
                                              .changePasswordVisibility();
                                        },
                                      ),
                                    )


                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text('Confirm Password*',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: mainFont,
                                            color: Colors.grey
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      SizedBox(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.3,
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.06,
                                        child: defaultFormField(
                                          context: context,
                                          controller: confirmPasswordController,
                                          type: TextInputType.visiblePassword,
                                          validate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field is empty';
                                            }
                                            if (value !=
                                                passwordController.text) {
                                              return 'Passwords do not match';
                                            }
                                            return null;
                                          },
                                          hintText: 'Confirm your password',
                                          prefix: Icons.lock,
                                          obscureText: RegisterCubit
                                              .get(context)
                                              .isNotVisible,
                                          suffix: RegisterCubit
                                              .get(context)
                                              .suffix,
                                          suffixPressed: () {
                                            RegisterCubit.get(context)
                                                .changePasswordVisibility();
                                          },
                                        ),

                                      ),
                                    ]
                                ),
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                isPerson ? Container() : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Specialization*',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: mainFont,
                                          color: Colors.grey
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.06,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: specializationController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'this field is empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Enter Specialization Of Company',

                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          focusColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                isPerson ? const SizedBox() : SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone Number*',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: mainFont,
                                          color: Colors.grey
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.06,
                                      child: TextFormField(
                                        keyboardType: TextInputType.phone,
                                        controller: phoneNumberController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'this field is empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Enter Your Phone Number',

                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          focusColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('City*',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: mainFont,
                                          color: Colors.grey
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.06,
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        controller: cityController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'this field is empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Enter Your City Name',

                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          focusColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Street*',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: mainFont,
                                          color: Colors.grey
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.06,
                                      child: TextFormField(
                                        keyboardType: TextInputType
                                            .streetAddress,
                                        controller: streetController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'this field is empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Street Name or Number',

                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          focusColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                  0.5),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.05,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (passwordController.text ==
                                          confirmPasswordController.text) {
                                        if (isPerson) {
                                          RegisterCubit.get(context)
                                              .userRegister(
                                              firstName: firstNameController
                                                  .text,
                                              lastName: lastNameController.text,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              phoneNumber: phoneNumberController
                                                  .text,
                                              city: cityController.text,
                                              street: streetController.text,
                                              context: context,
                                              isPerson: isPerson.toString()
                                          );
                                        }
                                        else {
                                          RegisterCubit.get(context)
                                              .companyRegister(
                                              name: companyNameController.text,
                                              specialization: specializationController
                                                  .text,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              phoneNumber: phoneNumberController
                                                  .text,
                                              city: cityController.text,
                                              street: streetController.text,
                                              context: context,
                                              isPerson: isPerson.toString()
                                          );
                                        }
                                      }
                                      else {
                                        print("not compatible password");
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.3,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.03,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          HexColor('#1B3358'),
                                          mainColor
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text('Sign Up',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 18
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.1,
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
          ),
        );
      },
    );
  }
}
