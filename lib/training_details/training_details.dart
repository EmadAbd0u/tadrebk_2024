import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/certificate/certificate.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/shared/cach_helper.dart';

import '../login_screen/login.dart';
import '../payment_page/payment.dart';
import '../profile/profile.dart';
import '../shared/colors.dart';
import '../shared/components.dart';
import '../shared/fonts.dart';
import '../shared/header_widget.dart';
import '../sign_up_screen/sign_up.dart';

class TrainingDetails extends StatefulWidget {
  final String description;
  final String companyName;
  final String trainingName;
  final String specialization;
  final String cost;
  final String startDate;
  final String endDate;
  final String city;
  final String street;
  final String category;
  final String image;
  final String id;
  final String isLiked;
  final String isPaid;

  TrainingDetails({
    required this.description,
    required this.companyName,
    required this.trainingName,
    required this.specialization,
    required this.cost,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.street,
    required this.category,
    required this.image,
    required this.id,
    required this.isPaid,
    required this.isLiked,
  });

  @override
  State<TrainingDetails> createState() => _TrainingDetailsState();
}

class _TrainingDetailsState extends State<TrainingDetails> {
  bool isLoggedIn = false;

  @override
  void initState() {
    isLoggedIn = cachHelper.getData(key: 'type') != null;
    ProfileCubit.get(context).getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStatus>(
      listener: (context, state) {},
      builder: (context, state) {
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

        return windowWidth >= 1100 && windowHeight >= 600
            ? Scaffold(
          body: Container(
            width: windowWidth,
            height: windowHeight,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderWidget(
                    index: 1,
                  ),
                  Container(
                    width: windowWidth,
                    height: windowHeight * 1.1,
                    color: secondColor,
                    child: Row(
                      children: [
                        Container(
                          width: windowWidth * 0.7,
                          height: windowHeight,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Container(
                                width: windowWidth * 0.6,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          LocaleText(
                                            'about',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: mainFont,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "  ${widget.trainingName}",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: mainFont,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '- ${widget.description}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: mainFont,
                                          color: mainColor,
                                        ),
                                        maxLines: null,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: windowWidth * 0.6,
                                child: Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        LocaleText(
                                          'details',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: mainFont,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20, right: 20),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    buildDetailRow(
                                                        'training_name_t', widget.trainingName),
                                                    buildDetailRow(
                                                        'training_specialization', widget.specialization),
                                                    buildDetailRow(
                                                        'training_cost_t', widget.cost),
                                                    buildDetailRow(
                                                        'start_date', widget.startDate),
                                                    buildDetailRow('end_date', widget.endDate),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    buildDetailRow('city_t', widget.city),
                                                    buildDetailRow('street_t', widget.street),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 1.1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.white,
                                    child: widget.image == ''
                                        ? Image.asset('assets/images/img_23.png')
                                        : Image.network(
                                      widget.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  height: MediaQuery.of(context).size.height * 0.64,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height * 0.08,
                                          color: mainColor,
                                          child: Center(
                                            child: LocaleText(
                                              'training_details',
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontFamily: mainFont,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        detailRow('training_name', widget.trainingName),
                                        Divider(),
                                        detailRow('lessons', '15 Lessons'),
                                        Divider(),
                                        detailRow('training_time', '${widget.startDate} to ${widget.endDate}'),
                                        Divider(),
                                        detailRow('training_cost', widget.cost),
                                        Divider(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: LocaleText(
                                            'not_required',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: mainFont,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Divider(),
                                        Spacer(),
                                        ratingRow(),
                                        SizedBox(height: 10),
                                        applyButton(context),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  footerPage(context),
                ],
              ),
            ),

          ),
        )
            : Container();
      },
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          LocaleText(
            label,
            style: TextStyle(
              fontSize: 14,
              fontFamily: mainFont,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontFamily: mainFont,
                color: mainColor,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }


  Widget applyButton(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .where('uId', isEqualTo: widget.id)
          .where('paymentUid',
          isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .snapshots(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        var data;
        String isPayed = 'false';

        if (!snapshots.hasError &&
            snapshots.hasData &&
            snapshots.data!.docs.isNotEmpty) {
          data = snapshots.data!.docs.first;
          isPayed = data['isPayed'] ?? 'false';
        }

        return InkWell(
          onTap: () {
            if (FirebaseAuth.instance.currentUser == null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            } else if (isPayed == 'true' || widget.cost == '0' || widget.cost.toLowerCase() == 'free') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Certificate(
                        trainingName: widget.trainingName,
                      )));
            } else {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: mainColor,
                  title: LocaleText(
                    "confirmation",
                    style: TextStyle(color: Colors.white),
                  ),
                  content: LocaleText(
                    "agreement",
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: LocaleText("no",
                          style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Payment(
                              companyName: widget.companyName,
                              city: widget.city,
                              street: widget.street,
                              trainingSpecialization: widget.specialization,
                              trainingCost: widget.cost,
                              trainingDescription: widget.description,
                              startDate: widget.startDate,
                              endDate: widget.endDate,
                              trainingName: widget.trainingName,
                              category: widget.category,
                              id: widget.id,
                              isLiked: widget.isLiked,
                              isPaid: widget.isPaid,
                              image: widget.image,
                            );
                          },
                        );
                      },
                      child: LocaleText("yes",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              );
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.03,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [HexColor('#1B3358'), mainColor],
              ),
            ),
            child: Center(
              child: LocaleText(
                isPayed == 'true' ? 'get_certificate' : 'apply_for_training',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget ratingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '(122)',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Icon(Icons.star, color: mainColor, size: 20),
        SizedBox(width: 5),
        Icon(Icons.star, color: mainColor, size: 20),
        SizedBox(width: 5),
        Icon(Icons.star, color: mainColor, size: 20),
        SizedBox(width: 5),
        Icon(Icons.star, color: mainColor, size: 20),
        SizedBox(width: 5),
        Icon(Icons.star_border, color: mainColor, size: 20),
      ],
    );
  }


  Widget detailRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: LocaleText(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily: mainFont,
                color: mainColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Text(
              content,
              style: TextStyle(
                fontSize: 14,
                fontFamily: mainFont,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }



}

