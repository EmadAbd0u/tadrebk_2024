import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/header_widget.dart';

class CategoryPages extends StatefulWidget {
  final String categoryName;

  CategoryPages({required this.categoryName});

  @override
  _CategoryPagesState createState() => _CategoryPagesState();
}

class _CategoryPagesState extends State<CategoryPages> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

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
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(index: 1),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.12,
                  color: mainColor, // اختر لونًا مناسبًا
                  child: Padding(
                    padding: const EdgeInsets.only(left: 200, right: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.categoryName,
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto', // اختر الخط المناسب
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 200.0, vertical: 20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search by name or cost...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value.toLowerCase().trim();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 100.0, right: 100.0, top: 20, bottom: 20),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('posts')
                          .where('category', isEqualTo: widget.categoryName)
                          .snapshots(),
                      builder: (context, snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final docs = snapshots.data?.docs ?? [];
                        final filteredDocs = docs.where((doc) {
                          final data =
                          doc.data() as Map<String, dynamic>;
                          final trainingName =
                              data['trainingName']?.toString().toLowerCase() ?? '';
                          final trainingCost =
                              data['trainingCost']?.toString() ?? '';

                          bool nameMatches =
                          trainingName.contains(searchQuery);
                          bool costMatches =
                          trainingCost.replaceAll(RegExp(r'[^\d]'), '')
                              .contains(searchQuery.replaceAll(RegExp(r'[^\d]'), ''));

                          return nameMatches || costMatches;
                        }).toList();

                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 0.88,
                          ),
                          itemCount: filteredDocs.length,
                          itemBuilder: (context, index) {
                            var data =
                            filteredDocs[index].data() as Map<String, dynamic>;

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
                ),
                footerPage(context),
              ],
            ),
          ),
        )
            : Container();
      },
    );
  }
}
