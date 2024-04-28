import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/header_widget.dart';

class ContactUsScreen extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _correspondenceSubjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // مرجع لمجموعة بيانات الاتصال في Firestore
  final CollectionReference _contactsCollection = FirebaseFirestore.instance
      .collection('contactUs');

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: backgrounColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderWidget(
              index: 2,
            ),

            Container(
              height: 300, // تغيير ارتفاع الصورة
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
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 23,
                      color: mainColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'For any inquiries or assistance, please feel free to contact us.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  MouseRegion(
                    cursor: MouseCursor.defer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildContactCard(context, icon: Icons.email,
                            title: 'Email',
                            subtitle: 'tadrebk.com'),
                        _buildContactCard(context, icon: Icons.assistant,
                            title: 'Smart Assistant',
                            subtitle: 'Click here for assistance'),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Correspondence Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildFormField(
                    context,
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    controller: _fullNameController,
                  ),
                  SizedBox(height: 10),
                  _buildFormField(
                    context,
                    label: 'Email',
                    hint: 'Enter your email address',
                    controller: _emailController,
                  ),
                  SizedBox(height: 10),
                  _buildFormField(
                    context,
                    label: 'Phone Number',
                    hint: 'Enter your phone number',
                    controller: _phoneNumberController,
                  ),
                  SizedBox(height: 10),
                  _buildFormField(
                    context,
                    label: 'Correspondence Subject',
                    hint: 'Enter the subject of your correspondence',
                    controller: _correspondenceSubjectController,
                  ),
                  SizedBox(height: 10),
                  _buildFormField(
                    context,
                    label: 'Message',
                    hint: 'Enter your message',
                    maxLines: 5,
                    controller: _messageController,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission
                      _uploadContactInfo(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          mainColor),
                    ),
                    child: Text(
                      'Send Message',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  const Text(
                    '“We are available within 24 hours and through automated"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 40),
                  SizedBox(height: 20),
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
                            Text(
                              'Our Vision:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'To be a leading specialized platform in physical training and to contribute to the advancement of knowledge and thought through the digitization of training. We provide training solutions in all fields through companies that sponsor our students and elevate the training offered by various companies.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.military_tech, color: mainColor,
                                size: 50),
                            SizedBox(height: 10),
                            Text(
                              'Our Mission:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'To create an environment characterized by ease and credibility, aiming to enable communication between unified electronic centers that provide value-added services contributing to the development of the training market in Egypt.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
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
      {required IconData icon, required String title, required String subtitle}) {
    return SizedBox(
      width: 200,
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
              Icon(
                icon,
                size: 40,
                color: mainColor,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
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
    );
  }

  Widget _buildFormField(BuildContext context,
      {required String label, required String hint, int maxLines = 1, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.grey[200], // Gray color for field
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

  // دالة لرفع بيانات الاتصال إلى Firestore
  void _uploadContactInfo(BuildContext context) async {
    try {
      // بناء البيانات
      final contactData = {
        'full_name': _fullNameController.text,
        'email': _emailController.text,
        'phone_number': _phoneNumberController.text,
        'subject': _correspondenceSubjectController.text,
        'message': _messageController.text,
      };

      // إضافة بيانات الاتصال إلى Firestore
      await _contactsCollection.add(contactData);

      // عرض رسالة نجاح
      _showConfirmationDialog(context);
    } catch (error) {
      // عرض رسالة خطأ إذا فشل التحميل
      print('Error uploading contact info: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send message')),
      );
    }
  }

  // عرض رسالة تأكيد بعد إرسال الرسالة
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message Sent'),
          content: Text(
              'Thank you for contacting us! We will get back to you as soon as possible.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

