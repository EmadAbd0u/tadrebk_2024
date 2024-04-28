import 'package:flutter/material.dart';
import 'package:tadrebk/get_trainings/get%20_trainings_page.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/header_widget.dart';


class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            HeaderWidget(
              index: 3,
            ),


            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Professional Training Solutions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Providing high-quality training programs for individuals and companies',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Center(
                    child: Text(
                      'Our Features',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureCard(
                        context,
                        icon: Icons.group,
                        title: 'More than 9000 trainees',
                        subtitle: 'Trained and certified',
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.business,
                        title: 'Partnership with top companies',
                        subtitle: 'In all training fields',
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.star,
                        title: 'Positive Course Ratings',
                        subtitle: 'Good ratings for all courses',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureCard(
                        context,
                        icon: Icons.school,
                        title: 'Over 10,000 students trained',
                        subtitle: 'In various fields',
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.badge,
                        title: 'Over 6500 Graduates',
                        subtitle: 'In all specializations',
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.star,
                        title: 'Positive Course Ratings',
                        subtitle: 'Good ratings for all courses',
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  GetTrainings(),
                        ));

                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          alignment: Alignment.center,
                          width: 500,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Explore Trainings',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: mainColor,
                    width: double.infinity,
                    height: 2,
                  ),
                  SizedBox(height: 60),
                  Text(
                    'Benefits of your Training :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFeature('A variety of training courses'),
                        _buildFeature('Customized training programs tailored to individual or company needs'),
                        _buildFeature('Certified credentials upon successful completion of courses'),
                        _buildFeature('Free training opportunities and scholarships'),
                        _buildFeature('Interactive learning experience with practical exercises and challenges'),
                        _buildFeature('Online platform for communication between trainers, trainees, and companies'),
                        _buildFeature('Extensive library of educational resources, including ebooks, videos, and articles'),
                        _buildFeature('Regular reports and statistics on learner performance and course evaluations'),
                      ],
                    ),
                  ),
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
                            Icon(Icons.military_tech, color: mainColor, size: 50),
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
                  SizedBox(height: 100),
                ],
              ),
            ),
            footerPage(context),

          ],
        ),
      ),
    );
  }

  void _showPackageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: mainColor,
          title: Text(
            'Welcome to Tadrebk',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'You are in the right place!',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required IconData icon, String? title, String? subtitle}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _showPackageDialog(context);
        },
        child: SizedBox(
          width: 200,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 40,
                    color: mainColor,
                  ),
                  SizedBox(height: 10),
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle!,
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
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(Icons.check, color: mainColor),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

