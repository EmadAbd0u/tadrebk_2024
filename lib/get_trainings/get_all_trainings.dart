import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/get_trainings/get%20_trainings_page.dart';

import '../shared/colors.dart';
import '../shared/components.dart';
import '../shared/fonts.dart';
import '../shared/header_widget.dart';
import '../training_categories/category_pages.dart';

class GetAllTrainings extends StatefulWidget {
  const GetAllTrainings({Key? key}) : super(key: key);

  @override
  State<GetAllTrainings> createState() => _GetAllTrainingsState();
}

class _GetAllTrainingsState extends State<GetAllTrainings> {
  String searchQuery = '';
  final List<String> categories = [
    'Programming',
    'Engineering',
    'Marketing',
    'Accounting',
    'Communication',
    'Law',
    'Arts',
    'Business Management',
    'Nursing',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;
    final windowHeight = MediaQuery.of(context).size.height;

    return windowWidth >= 1100 && windowHeight >= 600
        ? Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(index: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LocaleText(
                          'all',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        LocaleText(
                          'training',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                            color: mainColor,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        LocaleText(
                          'of',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        LocaleText(
                          'tadrebk',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Search for training name...',
                      hintStyle: TextStyle(color: mainColor),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    color: Colors.blue.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                    child: Row(
                      children: [
                        ...categories.map((category) => buildCategoryButton(context, category)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final List<DocumentSnapshot> filteredList = snapshot.data!.docs.where((document) {
                        final String trainingName = document['trainingName'].toString().toLowerCase();
                        final String city = document['city'].toString().toLowerCase();
                        final String cost = document['trainingCost'].toString().toLowerCase();

                        final String searchLower = searchQuery.toLowerCase();

                        return trainingName.contains(searchLower) ||
                            city.contains(searchLower) ||
                            cost.contains(searchLower);
                      }).toList();

                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 0.88,
                        ),
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          var data = filteredList[index].data() as Map<String, dynamic>;
                          return trainingID(
                            image: data['image'] ?? '',
                            companyName: data['companyName'],
                            city: data['city'],
                            street: data['street'],
                            trainingSpecialization: data['trainingSpecialization'],
                            trainingCost: data['trainingCost'],
                            trainingDescription: data['trainingDescription'],
                            startDate: data['startDate'],
                            endDate: data['endDate'],
                            category: data['category'],
                            trainingName: data['trainingName'],
                            id: data['uId'],
                            isLiked: data['isLiked'],
                            isPaid: data['isPaid'] ?? '',
                            context: context,
                          );
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 60),
                footerPage(context),
              ],
            ),
          ],
        ),
      ),
    )
        : Container();
  }

  Widget buildCategoryButton(BuildContext context, String categoryName) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryPages(categoryName: categoryName)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          categoryName,
          style: TextStyle(
            fontFamily: mainFont,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: mainColor,
          ),
        ),
      ),
    );
  }
}

Widget category(context, name) {
  return Container(
    height: MediaQuery.of(context).size.width * 0.04,
    width: MediaQuery.of(context).size.width * 0.1,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: Center(
      child: Text(
        '$name',
        style: TextStyle(
            fontFamily: mainFont,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: mainColor),
      ),
    ),
  );
}
