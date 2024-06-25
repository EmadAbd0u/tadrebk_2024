import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tadrebk/get_trainings/get%20_trainings_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/header_widget.dart';

class ContactUsScreen extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _correspondenceSubjectController =
      TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final CollectionReference _contactsCollection =
      FirebaseFirestore.instance.collection('contactUs');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderWidget(index: 2),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/A3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LocaleText(
                    'contact_us',
                    style: TextStyle(
                      fontSize: 20,
                      color: mainColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10),
                  LocaleText(
                    'assistance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildContactCard(
                        context,
                        icon: Icons.email,
                        title: 'email',
                        subtitle: 'support',
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  LocaleText(
                    'correspondence_details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildFormField(
                    label: 'full_name',
                    hint: 'Enter your full name',
                    controller: _fullNameController,
                  ),
                  SizedBox(height: 10),
                  _buildFormField(
                    label: 'email',
                    hint: 'enter email address',
                    controller: _emailController,
                  ),
                  SizedBox(height: 10),
                  _buildFormField(
                    label: 'phone_number',
                    hint: 'enter your phone number',
                    controller: _phoneNumberController,
                  ),
                  SizedBox(height: 10),
                  _buildFormField(
                    label: 'correspondence_subject',
                    hint: 'Enter the subject of your correspondence',
                    controller: _correspondenceSubjectController,
                  ),
                  SizedBox(height: 10),
                  _buildFormField(
                    label: 'message',
                    hint: 'enter your message',
                    maxLines: 5,
                    controller: _messageController,
                  ),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [mainColor, Colors.black87, mainColor],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _uploadContactInfo(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Stack(

                          alignment: Alignment.center,

                          children: [
                            LocaleText(
                              'send_message',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  const LocaleText(
                    'available',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    color: mainColor,
                    width: double.infinity,
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.visibility, color: mainColor, size: 50),
                            SizedBox(height: 10),
                            LocaleText(
                              'our_message',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            LocaleText(
                              'our_message_description',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.military_tech,
                                color: mainColor, size: 50),
                            SizedBox(height: 10),
                            LocaleText(
                              'our_mission',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            LocaleText(
                              'our_mission_description',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            footerPage(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return GestureDetector(
      onTap: _sendEmail,
      child: SizedBox(
        width: 250,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: mainColor),
                SizedBox(height: 10),
                LocaleText(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                LocaleText(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(
      {required String label,
      required String hint,
      int maxLines = 1,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocaleText(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.grey[200],
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _uploadContactInfo(BuildContext context) async {
    try {
      if (_fullNameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _phoneNumberController.text.isEmpty ||
          _correspondenceSubjectController.text.isEmpty ||
          _messageController.text.isEmpty) {
        showToast(
          msg: 'Please fill all fields',
          state: ToastStates.WARNING,
        );
        return;
      }

      final contactData = {
        'full_name': _fullNameController.text,
        'email': _emailController.text,
        'phone_number': _phoneNumberController.text,
        'subject': _correspondenceSubjectController.text,
        'message': _messageController.text,
      };

      await _contactsCollection.add(contactData);

      _showConfirmationDialog(context, ToastStates.SUCCESS);
    } catch (error) {
      print('Error uploading contact info: $error');
      showToast(
        msg: 'Failed to send message',
        state: ToastStates.ERORR,
      );
    }
  }

  void _showConfirmationDialog(BuildContext context, ToastStates state) {
    Color dialogColor = chooseToastColor(state);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Message Sent',
            style: TextStyle(
              color: dialogColor,
            ),
          ),
          content: Text(
            'Thank you for contacting us! We will get back to you as soon as possible.',
            style: TextStyle(
              color: dialogColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: dialogColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _sendEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'Tadrebk@gmail.com',
      queryParameters: {
        'subject': 'Subject Here',
        'body': 'Message Body Here',
      },
    );

    try {
      await launch(_emailLaunchUri.toString());
    } catch (e) {
      print('Error launching email: $e');
    }
  }
}
