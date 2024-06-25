import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/header_widget.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  String selectedCategory = 'companies'; // Default category
  Color customColor = HexColor('#1B3358');

  List<bool> isQuestionOpenList = [];

  List<String> companyQuestions = [
    'company_register',
    'benefits_of_using',
    'post_a_training',
    'manage_company_profile',
    'accepted_payment_methods',
  ];

  List<List<String>> companyAnswers = [
    [
      'visit_our_website',
      'fill_out_the_required',
      'submit_registration_form',
      'review_application', //access_training_courses
    ],
    [
      'access_training_courses',
      'track_employee_progress',
      'connect_skilled_trainers',
    ],
    [
      'create_account_platform',
      'go_to_create_course',
      'fill_out_course_details',
      'submit_course_review',
      'course_approved_enroll',
    ],
    [
      'log_in_account',
      'navigate_to_profile',
      'update_company_information',
    ],

    [
      'payment_methods',

    ],




  ];

  List<String> individualQuestions = [
    'sign_up_as_an_individual',
    'free_courses_for_individuals',
    'course_completion_certificate',
    'find_courses_related_to_interests',
  ];
  List<List<String>> individualAnswers = [
    [
      'click_on',
      'required_information',
      'browsing_and_enrolling',
    ],
    [
      'free_courses',
      'explore_catalog',
      'course_topics',
    ],
    [
      'certificate_info',
      'view_download_certificates',
    ],



    [
      'search_courses',
      'browse_categories',
      'use_filters',
    ],

    [
      "profile_settings",
      "go_to_profile_settings",
      "save_updates",
    ],

    [
      "live_sessions_info",
      "check_course_details",
    ],

    [
      "payment_methods_depending",
    ],

  ];

  List<String> websiteQuestions = [
    "report_bug",
    "supported",
    "change_website",
  ];
  List<List<String>> websiteAnswers = [
    [
      "contact_support_email",
      "provide_issue_details",
    ],


    [
      "contact_customer_support",
      "use_live_chat",
    ],
    [
      "supported_browsers",
      "browser_update_info",
    ],
    [
      "update_payment_information",
      "enter_new_payment_details",
    ],
    [
      "change_website_language",
      "select_language_from_menu",
    ],

    [
      "share_courses_social_media",
      "use_social_media_share_buttons",
    ],
 
  ];

  @override
  void initState() {
    super.initState();
    isQuestionOpenList = List.filled(getCurrentQuestions().length, false);
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      isQuestionOpenList = List.filled(getCurrentQuestions().length, false);
    });
  }

  void toggleQuestion(int index) {
    setState(() {
      isQuestionOpenList[index] = !isQuestionOpenList[index];
    });
  }

  List<String> getCurrentQuestions() {
    switch (selectedCategory) {
      case 'companies':
        return companyQuestions;
      case 'individual':
        return individualQuestions;
      case 'website':
        return websiteQuestions;
      default:
        return [];
    }
  }

  List<List<String>> getCurrentAnswers() {
    switch (selectedCategory) {
      case 'companies':
        return companyAnswers;
      case 'individual':
        return individualAnswers;
      case 'website':
        return websiteAnswers;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              HeaderWidget(index: 4),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/A3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              const Center(
                child: LocaleText(
                  'all_faqs_for_tadrebk',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => selectCategory('companies'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: mainColor,
                    ),
                    child: const LocaleText(
                      'companies',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                  ElevatedButton(
                    onPressed: () => selectCategory('individual'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: mainColor,
                    ),
                    child: const LocaleText(
                      'individual',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                  ElevatedButton(
                    onPressed: () => selectCategory('website'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: mainColor,
                    ),
                    child: const LocaleText(
                      'website',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getCurrentQuestions().length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        onTap: () {
                          toggleQuestion(index);
                        },
                        title: LocaleText(
                          getCurrentQuestions()[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                        trailing: Icon(
                          isQuestionOpenList[index]
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ),
                      if (isQuestionOpenList[index])
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: getCurrentAnswers()[index].map((answer) {
                              return ListTile(
                                leading: const Icon(Icons.check_circle_outline,
                                    color: Colors.orange),
                                title: LocaleText(
                                  answer,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: mainColor,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      const SizedBox(height: 8.0),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              footerPage(context),
            ],
          ),
        ),
      ),
    );
  }
}
