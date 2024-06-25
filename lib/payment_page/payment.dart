import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:tadrebk/add_training/cubit.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/test_payment.dart';
import 'package:tadrebk/training_details/training_details.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../shared/colors.dart';
import '../shared/fonts.dart';

class Payment extends StatefulWidget {
  final String trainingDescription;
  final String companyName;
  final String trainingName;
  final String trainingSpecialization;
  final String trainingCost;
  final String startDate;
  final String endDate;
  final String city;
  final String street;
  final String category;
  final String image;
  final String id;
  final String isLiked;
  final String isPaid;

  const Payment({
    Key? key,
    required this.trainingDescription,
    required this.companyName,
    required this.trainingName,
    required this.trainingSpecialization,
    required this.trainingCost,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.street,
    required this.category,
    required this.image,
    required this.id,
    required this.isPaid,
    required this.isLiked,
  }) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _formKey = GlobalKey<FormState>();
  bool isPaid = false;

  Future<void> _payVisa(String amount) async {
    try {
      String paymentKey = await PaymobManager().getPaymentKey(int.parse(amount), "EGP");
      await launchUrl(
        Uri.parse("https://accept.paymob.com/api/acceptance/iframes/852141?payment_token=$paymentKey"),
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  void checkPaymentStatus() async {
    bool paid = await cachHelper.getData(key: 'isPaid') ?? false;
    setState(() {
      isPaid = paid;
    });
  }

  @override
  void initState() {
    super.initState();
    checkPaymentStatus();
  }

  void _storePaymentDetails() async {
    if (isPaid) {
      var userModel = ProfileCubit.get(context).userModel;
      var paymentId = FirebaseFirestore.instance.collection('payments').doc().id;

      await FirebaseFirestore.instance.collection('payments').doc(paymentId).set({
        'paymentId': paymentId,
        'userId': FirebaseAuth.instance.currentUser?.uid,
        'firstName': userModel?.firstName,
        'lastName': userModel?.lastName,
        'email': userModel?.email,
        'phoneNumber': userModel?.phoneNumber,
        'city': userModel?.city,
        'street': userModel?.street,
        'trainingId': widget.id,
        'trainingName': widget.trainingName,
        'amount': widget.trainingCost,
        'paymentDate': DateTime.now(),
      });

      // Navigate to TrainingDetails screen after successful payment
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TrainingDetails(
            description: widget.trainingDescription,
            companyName: widget.companyName,
            trainingName: widget.trainingName,
            specialization: widget.trainingSpecialization,
            cost: widget.trainingCost,
            startDate: widget.startDate,
            endDate: widget.endDate,
            city: widget.city,
            street: widget.street,
            category: widget.category,
            image: widget.image,
            id: widget.id,
            isPaid: 'true',
            isLiked: widget.isLiked,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.account_balance_wallet),
          SizedBox(width: 8),
          LocaleText(
            'paying_off',
            style: TextStyle(
              fontFamily: mainFont,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.close,
              size: 16,
            ),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                '${widget.trainingCost} EGP',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      await _payVisa(widget.trainingCost);
                      PostCubit.get(context).updatePost(
                        companyName: widget.companyName,
                        city: widget.city,
                        street: widget.street,
                        trainingSpecialization: widget.trainingSpecialization,
                        trainingCost: widget.trainingCost,
                        trainingDescription: widget.trainingDescription,
                        startDate: widget.startDate,
                        endDate: widget.endDate,
                        trainingName: widget.trainingName,
                        category: widget.category,
                        id: widget.id,
                        isLiked: widget.isLiked,
                        isPaid: 'true',
                        image: widget.image,
                      );
                      await cachHelper.saveData(key: 'isPaid', value: true);
                      Navigator.pop(context);
                      showToast(
                        msg: 'Paid Successfully with Visa',
                        state: ToastStates.SUCCESS,
                      );
                      setState(() {
                        isPaid = true;
                      });

                      // Store payment details in Firestore
                      _storePaymentDetails();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [HexColor('#1B3358'), mainColor],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Pay with Visa',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            isPaid
                ? Center(
                    child: Text(
                      'Payment confirmed',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
