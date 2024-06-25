import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/fonts.dart';

import '../login_screen/login.dart';
import '../shared/colors.dart';
import '../shared/header_widget.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStatus>(
      listener: (context,state){},
      builder: (context,state){


        final model = ProfileCubit.get(context).userModel;
        var firstName = model?.firstName;
        var lastName = model?.lastName;
        var email = model?.email;
        var phoneNumber = model?.phoneNumber;
        var image = model?.image;
        var city = model?.city;
        var street = model?.street;
        var isPerson = model?.isPerson;

        final windowWidth = MediaQuery.of(context).size.width;
        final windowHeight = MediaQuery.of(context).size.height;

        return windowWidth >=1100 && windowHeight >=600 ?   Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                  index: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.12,
                  color: mainColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 200, right: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LocaleText(
                          'Favorite',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: mainFont),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,

                  color: secondColor,
                  child: Padding(

                    padding: const EdgeInsets.only(
                      left:100.0,
                      right: 100.0,
                      top: 20,
                      bottom: 20
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('posts')
                          .where('isLiked', isEqualTo: 'true')
                          .where('paymentUid',isEqualTo: FirebaseAuth.instance.currentUser?.uid)
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
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshots.data!.docs[index]
                                .data() as Map<String, dynamic>;

                            return data['isLiked'] == 'true' ? trainingID(
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
                            ): Container();

                          },
                        );
                      },
                    ),
                  ),
                ),
                footerPage(context),
              ],
            ),
          ),
        ):Container();
      },
    );
  }
}
