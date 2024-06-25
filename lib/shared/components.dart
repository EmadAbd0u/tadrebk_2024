










import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
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
              image == ''
                  ? Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
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
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image.network('$image',fit: BoxFit.cover,),),
                  Container(
                    color:  Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                        onTap: () {
                          String? favorite;
                          isLiked == 'true' ? favorite = 'false' : favorite = 'true';
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
                            id: id,
                            isLiked: favorite,
                            isPaid: isPaid,
                          );
                        },
                        child: Icon(
                          isLiked == 'true' ? Icons.favorite : Icons.favorite_outline_rounded,
                          color: isLiked == 'true' ? mainColor : Colors.grey,
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
                    padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
                    child: Text(
                      trainingSpecialization,
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
                    padding: const EdgeInsets.only(left: 20, right: 20,),
                    child: Text(
                      trainingName,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: mainFont
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
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
                        id: id,
                        isLiked: isLiked,
                        isPaid: isPaid,
                      );
                    }),
                  );
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.025,
                      width: MediaQuery.of(context).size.width * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: mainColor,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: LocaleText(
                          'view',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Text(
              trainingDescription,
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

          Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.date_range, color: mainColor, size: 16,),
                        SizedBox(width: 4,),
                        Text(
                          '$startDate - $endDate',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: mainFont,
                              color: Colors.grey.withOpacity(0.7)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: mainColor, size: 16,),
                        SizedBox(width: 4,),
                        Text(
                          city,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: mainFont,
                              color: Colors.grey.withOpacity(0.7)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  '${int.tryParse(trainingCost) ?? 0 * 2} L.E',
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
                  '${(int.tryParse(trainingCost) ?? 0 * 2) * 2} L.E',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: mainFont,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey
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

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  LocaleText('contact_us',
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
                      Icon(Icons.email_outlined,color: mainColor,size: 20,),
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
                    LocaleText('about_us',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white

                      ),

                    ),
                    LocaleText('features',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    LocaleText('pricing',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    LocaleText('gallery',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    LocaleText('team',
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

                  LocaleText('subscribe',
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
                        child: LocaleText('subscribe',
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
                  LocaleText('follow_us',
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
          child: Row(
            children: [
              LocaleText('rights',
              style: TextStyle(
                color: Colors.white,

              ),
              ),
              Spacer(),
              LocaleText('privacy_policy',
              style: TextStyle(
                color: Colors.white,

              ),
              ),
              SizedBox(
                width: 20,
              ),
              LocaleText('terms_of_use',
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
              SizedBox(
                width: 20,
              ),
              LocaleText('sales_and_refunds',
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
              SizedBox(
                width: 20,
              ),
              LocaleText('legal',
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
              SizedBox(
                width: 20,
              ),
              LocaleText('site_map',
                style: TextStyle(
                  color: Colors.white,

                ),
              ),

            ],
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












