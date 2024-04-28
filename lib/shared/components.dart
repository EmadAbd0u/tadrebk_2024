





// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:tadrebk/shared/colors.dart';
// import 'package:tadrebk/shared/fonts.dart';
//
// Widget trainingID({
//   required String city,
//   required String image,
//   required String street,
//   required String companyName,
//   required BuildContext context,
//   required String trainingSpecialization,
//   required String trainingCost,
//   required String trainingDescription,
//   required String startDate,
//   required String endDate,
// }) =>
//     Card(
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//               height: MediaQuery.of(context).size.width * 0.12,
//               width: MediaQuery.of(context).size.width * 0.3,
//               child: Card(
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 child: image == ''
//                     ? Image.asset('assets/images/img.png',fit: BoxFit.cover,)
//                     : Image.network('$image',fit: BoxFit.cover,),
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20,right: 20,top: 10,),
//                 child: Expanded(
//                   child: Text(companyName,
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: mainFont
//                     ),
//                     maxLines: 1,
//                     textAlign: TextAlign.center,
//
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Padding(
//                 padding: const EdgeInsets.only(right: 20,top: 10,),
//                 child: Container(
//                   height: MediaQuery.of(context).size.width * 0.02,
//                   width: MediaQuery.of(context).size.width * 0.07,
//                   color: HexColor('#B5C9E7'),
//                   child: Expanded(
//                     child: Center(
//                       child: Text(trainingSpecialization,
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: mainFont,
//                             color: mainColor
//                         ),
//                         maxLines: 1,
//                         textAlign: TextAlign.center,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
//             child: Expanded(
//               child: Text(trainingDescription,
//                 style: TextStyle(
//                     fontSize: 12,
//                     fontFamily: mainFont,
//                     fontWeight: FontWeight.w600
//                 ),
//
//                 maxLines: 2,
//                 textAlign: TextAlign.start,
//                 overflow: TextOverflow.ellipsis,
//
//
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 40,right: 40,top: 10,),
//             child: Row(
//               children: [
//                 Icon(Icons.access_time_outlined,color: Colors.grey.withOpacity(0.5),size: 16,),
//                 Text(' 2h 40min',
//                   style: TextStyle(
//                     fontSize: 14,
//
//                     fontFamily: mainFont,
//
//                   ),
//                 ),
//
//                 Spacer(),
//
//                 Icon(Icons.local_library_outlined,color: Colors.grey.withOpacity(0.5),size: 16,),
//                 Text(' 15 Lectures',
//                   style: TextStyle(
//                     fontSize: 14,
//
//                     fontFamily: mainFont,
//
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//
//           Padding(
//             padding: const EdgeInsets.only(left: 20 , right: 20,top: 10,bottom: 8),
//             child: Container(
//               height: MediaQuery.of(context).size.width * 0.025,
//               width: MediaQuery.of(context).size.width ,
//              decoration: BoxDecoration(
//                color: HexColor('#B5C9E7'),
//                borderRadius: BorderRadius.circular(5)
//              ),
//               child: Expanded(
//                 child: Center(
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           trainingCost,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: mainFont,
//                             fontWeight: FontWeight.bold,
//                             color: mainColor
//                           ),
//                         ),
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Row(
//                           children: [
//                             Text(
//                               '4.9 ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: mainFont,
//                                 fontWeight: FontWeight.bold,
//                                 color: mainColor
//                               ),
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: mainColor,
//                               size: 16,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: mainColor,
//                               size: 16,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: mainColor,
//                               size: 16,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: mainColor,
//                               size: 16,
//                             ),
//                             Icon(
//                               Icons.star_border,
//                               color: mainColor,
//                               size: 16,
//                             ),
//
//
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );







import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../add_training/cubit.dart';
import '../training_details/training_details.dart';

Widget trainingID({
  required String city,
  required String image,
  required String street,
  required String companyName,
  required BuildContext context,
  required String trainingSpecialization,
  required String trainingCost,
  required String trainingDescription,
  required String startDate,
  required String endDate,
  required String category,
  required String trainingName,
  required String id,
  required String isLiked,
  required String isPaid,
}) =>
    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: image == ''
                      ? Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.width * 0.2,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset('assets/images/img_20.png',fit: BoxFit.cover,)),
                      Container(
                        color:  Colors.black.withOpacity(0.3),
                      ),
                    ],
                  )
                      : Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.network('$image',fit: BoxFit.cover,),),
                      Container(
                        color:  Colors.black.withOpacity(0.3),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.only (top: 10,left: 10,right: 10),
                child: Row(
                  children: [
                    Text(
                      '4.9 ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: mainFont,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 20,
                    ),

                    Spacer(),

                    CircleAvatar(

                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                      child: InkWell(
                        onTap: (){
                          String? favorite ;
                        isLiked == 'true' ? favorite = 'false': favorite ='true';
                        PostCubit.get(context).updatePost(
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
                          id:id,
                          isLiked: favorite,
                          isPaid: isPaid,
                        );
                        },
                        child: Icon(
                          isLiked == 'true' ?Icons.favorite:Icons.favorite_outline_rounded,
                          color: isLiked == 'true' ?mainColor: Colors.grey,
                        ),
                      ),


                    ),



                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20,top: 10,left: 20),
                    child: Text(trainingSpecialization,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: mainFont,
                        color: Colors.grey.withOpacity(0.7),
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,),
                    child: Expanded(
                      child: Text(trainingName,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,

                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),

              InkWell(
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return TrainingDetails(
                        image: image,
                        companyName: companyName,
                        city: city,
                        street: street,
                        specialization: trainingSpecialization,
                        cost: trainingCost,
                        description: trainingDescription,
                        startDate: startDate,
                        endDate: endDate,
                        category: category,
                        trainingName: trainingName,
                        id:id,
                        isLiked: isLiked,
                        isPaid: isPaid,
                      );
                    }
                    ),
                  );

                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.025,
                    width: MediaQuery.of(context).size.width * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:Border.all(
                          color: mainColor,
                          width: 2
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'View',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                            color: mainColor
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Expanded(
              child: Text(trainingDescription,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: mainFont,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.withOpacity(0.5)
                ),

                maxLines: 1,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,


              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20,right: 20,top: 10,),
          //   child: Row(
          //     children: [
          //       Icon(Icons.access_time_outlined,color: Colors.grey.withOpacity(0.5),size: 16,),
          //       Text(' 2h 40min',
          //         style: TextStyle(
          //           fontSize: 14,
          //
          //           fontFamily: mainFont,
          //           color: Colors.grey
          //
          //         ),
          //       ),
          //
          //       // Spacer(),
          //       //
          //       // Icon(Icons.local_library_outlined,color: Colors.grey.withOpacity(0.5),size: 16,),
          //       // Text(' 15 Lectures',
          //       //   style: TextStyle(
          //       //     fontSize: 14,
          //       //
          //       //     fontFamily: mainFont,
          //       //       color: Colors.grey
          //       //
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 20 , right: 20,top: 10,bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  trainingCost,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: mainFont,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  trainingCost,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: mainFont,

                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey

                  ),
                ),
                Spacer(),

                Icon(Icons.local_library_outlined,color: Colors.grey.withOpacity(0.5),size: 16,),
                Text(' 15 Lectures',
                  style: TextStyle(
                      fontSize: 14,

                      fontFamily: mainFont,
                      color: Colors.grey

                  ),
                ),




              ],
            ),
          ),

        ],
      ),
    );












void _launchUrl(
    link,
    ) async {
  String? url = link;
  if (await canLaunch(url??'')) {
    await launch(url??'');
  } else {
    throw 'Could not launch $url';
  }
}






Widget footerPage(context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.45,
    decoration:BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          HexColor('#1B3358'),
          mainColor
        ],
      ),
    ),
    child: Column(

      children:[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.05,
        ),
        Row(

          children: [
            Image.asset('assets/images/img_14.png',
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.2,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.25,
              height: MediaQuery.of(context).size.height*0.35,
              padding: EdgeInsets.only(left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text('Contact Us',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                        fontWeight: FontWeight.bold,
                      color:Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                        child: Icon(Icons.email_outlined,color: mainColor,size: 20,),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (){

                          _launchUrl('https://mail.google.com/mail/u/0/');
                        },
                        child: Text('support@gmail.com',

                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: mainFont,
                              color:Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.25,
              height: MediaQuery.of(context).size.height*0.35,

              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('About',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white

                      ),

                    ),
                    Text('Features',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    Text('Pricing',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    Text('Gallery',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    Text('Team',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white



                      ),

                    ),


                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.25,
              height: MediaQuery.of(context).size.height*0.35,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text('Subscribe',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                        fontWeight: FontWeight.bold,
                        color:Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: mainColor,
                    width: MediaQuery.of(context).size.width * 0.18,
                    height: MediaQuery.of(context).size.height*0.04,

                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: TextEditingController(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'this field is empty';
                        }
                      },
                      decoration: InputDecoration(


                        hintText: '  Email',


                        hintStyle: TextStyle(color: Colors.white,fontSize: 10),


                        enabledBorder: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),




                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: mainColor,


                    child:   Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.height*0.04,
                      color: HexColor('#B5C9E7'),
                      child: Center(
                        child: Text('Subscribe',
                          style: TextStyle(
                              color: mainColor,
                              fontFamily: 'Poppins',
                              fontSize: 15,

                          ),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  ),
                  Text('Follow Us',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                        fontWeight: FontWeight.bold,
                        color:Colors.white
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Row(

                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor('#B5C9E7'),
                        child: Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundColor: HexColor('#B5C9E7'),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundColor: HexColor('#B5C9E7'),
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundColor: HexColor('#B5C9E7'),
                        child: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100,right: 100),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.05,
            child: Row(
              children: [
                Text('© 2021 All Rights Reserved',
                style: TextStyle(
                  color: Colors.white,

                ),
                ),
                Spacer(),
                Text('Privacy Policy',
                style: TextStyle(
                  color: Colors.white,

                ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Terms of Use',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Sales and Refunds',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Legal',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Site Map',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),

              ],
            ),
          ),
        ),
      ],

    ),
  );
}






















void showToast({required String msg, required ToastStates state})=>Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0);

enum ToastStates{ERORR, SUCCESS, WARNING}

Color chooseToastColor(ToastStates test){
  Color color;
  switch(test){

    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERORR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.orange;
      break;



  }

  return color;
}





///-----------------------------------

class defaultFormFieldValidator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
      return 'Password must contain uppercase and lowercase letters, numbers, and special characters';
    }
    return null;
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
      return 'Please enter a valid Egyptian phone number';
    }
    return null;
  }

  static void showPasswordSnackbar(BuildContext context, String? errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage ?? 'Please enter a strong password',
          style: TextStyle(color: errorMessage != null ? Colors.red : Colors.green),
        ),
      ),
    );
  }
}





///------------------------[defaultFormField/*----------------------------Start--

Widget defaultFormField({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  bool isPassword = false,
  required String? Function(String?) validate,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  String? hintText,
  required bool obscureText, // إضافة المعامل هنا
}) =>
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        obscureText: obscureText, // استخدام المعامل هنا
        onFieldSubmitted: onSubmit as void Function(String)?,
        onChanged: onChanged as void Function(String)?,
        enabled: isClickable,
        onTap: onTap as void Function()?,
        validator: validate,
        decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          suffixIcon: suffix != null
              ? InkWell(
            onTap: () {
              suffixPressed?.call();
            },
            child: Icon(suffix, color: Colors.grey, size: 16),
          )
              : null,
        ),
      ),
    );


///------------------------[DefaultFormFieldValidator/*--------------------start--
//-----------------------------------------------------------------------

