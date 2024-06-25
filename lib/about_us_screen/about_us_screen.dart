import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tadrebk/get_trainings/get%20_trainings_page.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/header_widget.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(index: 3),
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
              height: 300,
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
                    child: LocaleText(
                      'about_us',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: LocaleText(
                      'an_integrated',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: LocaleText(
                      'we_aim',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],

                      ),
                      textAlign: TextAlign.center  ,

                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.school, size: 150, color: mainColor),
                        SizedBox(height: 10),
                        LocaleText(
                          'tadrebk',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureBox(
                        icon: Icons.business,
                        title: 'for_companies',
                        description: 'for_companies_description',
                      ),
                      _buildFeatureBox(
                        icon: Icons.person,
                        title: 'for_individuals',
                        description: 'for_individuals_description',
                      ),
                    ],
                  ),

                  SizedBox(height: 50),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GetTrainings()),
                        );
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
                          child: LocaleText(
                            'explore_trainings',
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
                  Center(
                    child: LocaleText(
                      'benefits_of_your_training',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //-------------------------------------------------
                        SizedBox(height:100 ,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildFeatureBox(
                              icon: Icons.timer,
                              title: 'save_time',
                              description: '',
                            ),
                            //-------------------------------------------------
                            SizedBox(width:20 ,),

                            _buildFeatureBox(
                              icon: Icons.money,
                              title: 'save_money',
                              description: '',
                            ),
                            //-------------------------------------------------
                            SizedBox(width:20 ,),

                            _buildFeatureBox(
                              icon: Icons.check,
                              title: 'direct_interaction',
                              description: '',
                            ),


                          ],
                        ),





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
                      SizedBox(width: 100),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.military_tech, color: mainColor, size: 50),
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

  Widget _buildFeatureBox({required IconData icon, required String title, required String description}) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: mainColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, size: 60, color: Colors.amber),
          SizedBox(height: 10),
          LocaleText(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
          SizedBox(height: 10),
          LocaleText(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(String key) {
    final Map<String, String> trainingBenefits = {
      "variety_of_courses": "variety_of_courses",
      "customized_programs": "customized_programs",
      "certified_credentials": "certified_credentials",
      "free_opportunities": "free_opportunities",
      "interactive_experience": "interactive_experience",
      "online_platform": "online_platform",
      "educational_resources": "educational_resources",
      "performance_reports": "performance_reports",
    };

    final text = trainingBenefits[key] ?? '';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.amber),
          SizedBox(width: 10),
          LocaleText(
            text,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
