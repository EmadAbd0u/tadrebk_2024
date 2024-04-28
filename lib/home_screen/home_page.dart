import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/add_training/post.dart';
import 'package:tadrebk/profile/profile.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/sign_up_screen/sign_up.dart';
import 'package:url_launcher/url_launcher.dart';


import '../get_trainings/get _trainings_page.dart';
import '../login_screen/login.dart';
import '../profile/cubit.dart';
import '../profile/states.dart';
import '../shared/fonts.dart';
import '../shared/header_widget.dart';
import '../training_categories/training_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 bool isLoggedIn=false;


@override
void initState() {

  isLoggedIn = cachHelper.getData(key: 'type')!=null;
  ProfileCubit.get(context).getUserData();
  ProfileCubit.get(context).getCompanyData();

    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ProfileCubit,ProfileStatus>(
      listener: (context,state){},
      builder: (context,state){


        return Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    HeaderWidget(
                      index: 0,
                    ),

                    Stack(
                      children: [
                        Image.asset('assets/images/img_1.png',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.84,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.76,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40, left: 80),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.24,
                                      height:
                                      MediaQuery.of(context).size.height * 0.4,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'Develop Your Skills in a new and unique way',
                                              style: TextStyle(
                                                fontSize: 34,
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Our website is an ideal destination for individuals who want to enhance their skills through practical exercises. We offer a wide range of training programs in various fields. Our website is user-friendly and provides a simple interface that allows you to access the content easily and flexibly.',
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height * 0.22,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const GetTrainings()),
                                              );
                                              print('تم النقر على الـ GetTrainings');
                                              // يمكنك استبدال هذا الإجراء بأي شيء ترغب فيه
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.08,
                                              height: MediaQuery.of(context).size.height * 0.2,
                                              child: Card(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top: 8),
                                                        child: Image.asset(
                                                          'assets/images/img_10.png',
                                                          width: MediaQuery.of(context).size.width * 0.04,
                                                          height: MediaQuery.of(context).size.height * 0.1,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '30000+',
                                                      style: TextStyle(
                                                        color: mainColor,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    const Padding(
                                                      padding: EdgeInsets.only(bottom: 6),
                                                      child: Text(
                                                        'Training',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ), Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.08,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                            child: Card(
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 8),
                                                      child: Image.asset(
                                                        'assets/images/img_11.png',
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.04,
                                                        height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.1,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 6),
                                                    child: Text(
                                                      'Certificate',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const Post()),
                                              );
                                              print('تم النقر على الـ Post');
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.08,
                                              height: MediaQuery.of(context).size.height * 0.2,
                                              child: Card(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top: 8),
                                                        child: Image.asset(
                                                          'assets/images/img_7.png',
                                                          width: MediaQuery.of(context).size.width * 0.04,
                                                          height: MediaQuery.of(context).size.height * 0.1,
                                                        ),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    const Padding(
                                                      padding: EdgeInsets.only(bottom: 6),
                                                      child: Text(
                                                        'Add Training',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.64,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Image.asset(
                                        'assets/images/img_8.png',
                                        width:
                                        MediaQuery.of(context).size.width * 0.32,
                                        height:
                                        MediaQuery.of(context).size.height * 0.44,
                                      ),
                                      Image.asset(
                                        'assets/images/img_8.png',
                                        width:
                                        MediaQuery.of(context).size.width * 0.32,
                                        height:
                                        MediaQuery.of(context).size.height * 0.4,
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/images/img_5.png',
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height * 0.34,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/images/img_13.png',
                                          width: MediaQuery.of(context).size.width *
                                              0.08,
                                        ),
                                        ClipRect(
                                          clipper: TopClipper(),
                                          child: Image.asset(
                                            'assets/images/img_12.png',
                                            width: MediaQuery.of(context).size.width *
                                                0.18,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.48,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 100,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width*0.12,
                      height: MediaQuery.of(context).size.width*0.03,
                      color: mainColor,
                      child: Center(child: Text('OUR SERVICES',

                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                            color: Colors.white
                        ),
                      ),),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.7,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            introComponents(
                                context,
                                'assets/images/img_18.png',
                                'Training',
                                '"Explore the realm of knowledge and gain new skills through our innovative platform for course delivery. Embark on an exciting learning journey and acquire life-changing'

                            ),
                            introComponents(
                                context,
                                'assets/images/img_19.png',
                                'Certificate',
                                '"We provide certified credentials upon successfully completing courses, enhancing job opportunities and personal professional development'

                            ),
                            introComponents(
                                context,
                                'assets/images/img_20.png',
                                'Find your training',
                                '"The search feature enables users to easily find relevant courses based on their interests and needs'
                            ),
                            introComponents(
                                context,
                                'assets/images/img_21.png',
                                'Add Training',
                                '"The platform enables companies to provide customized training and effectively track participant progress'
                            ),
                            SizedBox(width: 4,),

                          ],
                        ),
                      ),
                    ),

                    Container(

                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.95,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1
                        ),
                      ),


                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text('OUR TRAININGS',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: mainFont,
                                  color: mainColor
                              ),



                            ),
                            SizedBox(
                              height: 40,
                            ),

                            Padding(

                              padding: const EdgeInsets.only(
                                left:100.0,
                                right: 100.0,
                              ),
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('posts')
                                    .snapshots(),
                                builder: (context, snapshots) {
                                  return (snapshots.connectionState ==
                                      ConnectionState.waiting)
                                      ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                      : GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),

                                    shrinkWrap: true,
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:3,
                                      crossAxisSpacing: 20.0,
                                      mainAxisSpacing: 20.0,
                                      childAspectRatio: 0.88, // Adjust the aspect ratio as needed

                                    ),
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      var data = snapshots.data!.docs[index]
                                          .data() as Map<String, dynamic>;

                                        return trainingID(
                                          image: data['image'] ?? '',
                                          companyName: data['companyName'],
                                          city: data['city'],
                                          street: data['street'],
                                          trainingSpecialization:
                                          data['trainingSpecialization'],
                                          trainingCost: data['trainingCost'],
                                          trainingDescription:
                                          data['trainingDescription'],
                                          startDate: data['startDate'],
                                          endDate: data['endDate'],
                                          category: data['category'],
                                          trainingName: data['trainingName'],
                                          id:data['uId'],
                                          isLiked: data['isLiked'],
                                          isPaid: data['isPaid']??'',
                                          context: context,
                                        );

                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.12,
                              height: MediaQuery.of(context).size.width*0.03,
                              color: mainColor,
                              child: Center(child: Text('View Courses',

                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: mainFont,
                                    color: Colors.white
                                ),
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.66,
                      decoration: BoxDecoration(

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
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text('Customer reviews',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: mainFont,
                              color: Colors.white
                            ),



                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100,right: 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                reviewWidget(context,
                                    'Emad abdu',
                                    'Cairo,Egypt',
                                    'I found that this website, which provides practical training, was beneficial and rewarding in enhancing my skills'
                                ),
                                reviewWidget(context,
                                    'Emad abdu',
                                    'Cairo,Egypt',
                                    'I found that this website, which provides practical training, was beneficial and rewarding in enhancing my skills'
                                ),
                                reviewWidget(context,
                                    'Emad abdu',
                                    'Cairo,Egypt',
                                    'I found that this website, which provides practical training, was beneficial and rewarding in enhancing my skills'
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100,right: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text('+30K ',
                                 style: TextStyle(
                                     fontSize: 35,
                                     color: mainColor,
                                     fontFamily: mainFont,
                                 ),


                               ),
                               Text('Training ',
                                 style: TextStyle(
                                     fontSize: 35,
                                     color: mainColor,
                                     fontFamily: mainFont,
                                 ),


                               ),
                             ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100,right: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text('+50K ',
                                 style: TextStyle(
                                     fontSize: 35,
                                     color: mainColor,
                                     fontFamily: mainFont,
                                 ),


                               ),
                               Text('views',
                                 style: TextStyle(
                                     fontSize: 35,
                                     color: mainColor,
                                     fontFamily: mainFont,
                                 ),


                               ),
                             ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100,right: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text('+50K',
                                 style: TextStyle(
                                     fontSize: 35,
                                     color: mainColor,
                                     fontFamily: mainFont,
                                 ),


                               ),
                               Text('Happy customers',
                                 style: TextStyle(
                                     fontSize: 35,
                                     color: mainColor,
                                     fontFamily: mainFont,
                                 ),


                               ),
                             ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    footerPage(context),
                  ],
                ),
              )),
        );
      },
    );
  }
}

class TopClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 1, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}


Widget introComponents(
    context,
    image,
    text1,
text2
    ){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 20,top: 60,),
      child: Container(
        width: MediaQuery.of(context).size.width*0.23,
        height: MediaQuery.of(context).size.height*0.6,
        child: Column(

          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.14,
              height: MediaQuery.of(context).size.height*0.26,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(image,
                fit: BoxFit.cover,

              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(text1,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: mainFont,
                  color: mainColor
              ),

            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Text(text2,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: mainFont,

                  letterSpacing: 1.5
                ),
                textAlign: TextAlign.start,


              ),
            ),
          ],
        ),
      ),
    ),
  );
}



Widget reviewWidget(
    context,
    name,
    address,
    description
    ){
  return  SizedBox(
    child: Container( width: MediaQuery.of(context).size.width*0.26,
      height: MediaQuery.of(context).size.height*0.32,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,),
              child: Container(
                width: MediaQuery.of(context).size.width*0.26,
                height: MediaQuery.of(context).size.height*0.14,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/img_34.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14,bottom: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(name,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: mainFont,

                              ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,


                            ),
                          ),
                          Expanded(
                            child: Text(address,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: mainFont,
                                  color: Colors.grey

                              ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,


                            ),
                          ),
                          Row(
                            children: [


                              Text(
                                '4.9',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.bold,
                                    color: mainColor
                                ),
                              ),

                              SizedBox(width: 5),


                              Icon(
                                Icons.star,
                                color: mainColor,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: mainColor,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: mainColor,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: mainColor,
                                size: 14,
                              ),
                              Icon(
                                Icons.star_border,
                                color: mainColor,
                                size: 14,
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,bottom: 20),
              child: Text(
                description,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: mainFont,
                    color: Colors.grey


                ),
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,


              ),
            ),
          ],
        ),

      ),
    ),
  );
}



