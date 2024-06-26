import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/add_training/cubit.dart';
import 'package:tadrebk/add_training/states.dart';
import 'package:tadrebk/shared/fonts.dart';

import '../my_trainings/paid_trainings.dart';
import '../shared/colors.dart';
import '../shared/header_widget.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var formKey = GlobalKey<FormState>();
  var companyNameController = TextEditingController();
  var trainingNameController = TextEditingController();
  var cityController = TextEditingController();
  var streetController = TextEditingController();
  var trainingSpecializationController = TextEditingController();
  var trainingCostController = TextEditingController();
  var trainingDescriptionController = TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  String? category;
  int index = 0;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostStatus>(
        listener: (context, state) {
          if(state is CreatePostSuccessState){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>PaidTrainings()), (route) => false);
          }
        },
        builder: (context, state) {
          final windowWidth = MediaQuery.of(context).size.width;
          final windowHeight = MediaQuery.of(context).size.height;

          return windowWidth >= 1100 && windowHeight >= 500
              ? Scaffold(
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeaderWidget(
                      index: 4,
                    ),

                    //
                    if (state is CreatePostLoadingState)
                      LinearProgressIndicator(),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.86,
                      child: ListView(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 60, top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height *
                                  0.08,
                              child: Row(
                                children: [
                                  LocaleText(
                                    'add',
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
                                        color: mainColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Card(
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 20),
                                        child: LocaleText(
                                          'upload_photo',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: mainFont,
                                              color: Colors.black54,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: InkWell(
                                          onTap: () {
                                            PostCubit.get(context)
                                                .getPostImage();
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.18,
                                            clipBehavior: Clip
                                                .antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20),
                                              color: Colors.grey
                                                  .withOpacity(0.1),
                                              border: Border.all(
                                                color: mainColor,
                                                width: 2,
                                              ),
                                            ),
                                            child:
                                            PostCubit.get(context)
                                                .postImage !=
                                                null
                                                ? Stack(
                                              alignment:
                                              AlignmentDirectional
                                                  .topEnd,
                                              children: [
                                                Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.3,
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.2,
                                                    child: Image
                                                        .memory(
                                                      PostCubit.get(
                                                          context)
                                                          .postImage!,
                                                      fit: BoxFit
                                                          .cover,
                                                    )),
                                                IconButton(
                                                    onPressed:
                                                        () {
                                                      PostCubit.get(
                                                          context)
                                                          .removePostImage();
                                                    },
                                                    icon:
                                                    CircleAvatar(
                                                      backgroundColor:
                                                      mainColor,
                                                      child:
                                                      Icon(
                                                        Icons
                                                            .close,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    )),
                                              ],
                                            )
                                                : Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Icon(
                                                  Icons.image,
                                                  color: Colors
                                                      .grey,
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                LocaleText(
                                                  'select_file',
                                                  style:
                                                  TextStyle(
                                                    fontSize:
                                                    12,
                                                    fontFamily:
                                                    mainFont,
                                                    color: Colors
                                                        .black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,

                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.name,
                                            controller:
                                            companyNameController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText:
                                              'Enter your Company Name',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,

                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.name,
                                            controller:
                                            trainingNameController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText:
                                              'Enter Training Name',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,

                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.name,
                                            controller: cityController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'City',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,

                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.name,
                                            controller: streetController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Street',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,

                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.name,
                                            controller:
                                            trainingSpecializationController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText:
                                              'Enter Training Specialization',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,

                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.name,
                                            controller:
                                            trainingCostController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText:
                                              'Enter Training Cost',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.18,
                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.name,
                                            controller:
                                            trainingDescriptionController,
                                            maxLines: 20,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText:
                                              'Training Description',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 40, right: 40),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,

                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.14,

                                                child: TextFormField(
                                                  readOnly: true,
                                                  controller:
                                                  startDateController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'this field is empty';
                                                    }
                                                  },
                                                  onTap: () => _selectDate(
                                                      context,
                                                      startDateController),
                                                  decoration:
                                                  InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                    Colors.white,
                                                    hintText:
                                                    'Start Date',
                                                    hintStyle: TextStyle(
                                                        color:
                                                        Colors.grey,
                                                        fontSize: 12),
                                                    focusColor:
                                                    Colors.white,
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10)),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .withOpacity(
                                                              0.5)),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10)),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .withOpacity(
                                                              0.5)),
                                                    ),
                                                    disabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10)),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .withOpacity(
                                                              0.5)),
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10)),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .withOpacity(
                                                              0.5)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.14,

                                                child: TextFormField(
                                                  readOnly: true,
                                                  controller:
                                                  endDateController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'this field is empty';
                                                    }
                                                  },
                                                  onTap: () => _selectDate(
                                                      context,
                                                      endDateController),
                                                  decoration:
                                                  InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                    Colors.white,
                                                    hintText: 'End Date',
                                                    hintStyle: TextStyle(
                                                        color:
                                                        Colors.grey,
                                                        fontSize: 12),
                                                    focusColor:
                                                    Colors.white,
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10)),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .withOpacity(
                                                              0.5)),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10)),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .withOpacity(
                                                              0.5)),
                                                    ),
                                                    disabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10)),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .withOpacity(
                                                              0.5)),
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10)),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey
                                                              .withOpacity(
                                                              0.5)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40),
                                        child: LocaleText(
                                          'choose_category',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: mainFont,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (_formKey.currentState!.validate()) {
                                            final categories = [

                                              'programming',
                                              'Engineering',
                                              'Marketing',
                                              'Accounting',
                                              'Arts',
                                              'Business Management',
                                              'Nursing',
                                              'Law',
                                              'Others'
                                            ];

                                            String selectedCategory = categories[index];

                                            if (PostCubit.get(context).postImage == null) {
                                              PostCubit.get(context).createPost(
                                                companyName: companyNameController.text,
                                                category: selectedCategory,
                                                trainingName: trainingNameController.text,
                                                city: cityController.text,
                                                street: streetController.text,
                                                trainingSpecialization: trainingSpecializationController.text,
                                                trainingCost: trainingCostController.text,
                                                trainingDescription: trainingDescriptionController.text,
                                                startDate: startDateController.text,
                                                endDate: endDateController.text,
                                                image: '',
                                              );
                                            } else {
                                              PostCubit.get(context).uploadPost(
                                                companyName: companyNameController.text,
                                                category: selectedCategory,
                                                trainingName: trainingNameController.text,
                                                city: cityController.text,
                                                street: streetController.text,
                                                trainingSpecialization: trainingSpecializationController.text,
                                                trainingCost: trainingCostController.text,
                                                trainingDescription: trainingDescriptionController.text,
                                                startDate: startDateController.text,
                                                endDate: endDateController.text,
                                                context: context,
                                              );
                                            }
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 30),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.3,
                                            height: MediaQuery.of(context).size.width * 0.03,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  HexColor('#1B3358'),
                                                  mainColor
                                                ],
                                              ),
                                            ),
                                            child: Center(
                                              child: LocaleText(
                                                'submit',
                                                style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

// Updated category selection code
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          child: Wrap(
                                            children: List.generate(9, (index) {
                                              final categoryNames = [
                                                'programming',
                                                'Engineering',
                                                'Marketing',
                                                'Accounting',
                                                'Arts',
                                                'Business Management',
                                                'Nursing',
                                                'Law',
                                                'Others'
                                              ];

                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    this.index = index;
                                                  });
                                                },
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.1,
                                                  height: MediaQuery.of(context).size.height * 0.06,
                                                  child: Card(
                                                    color: this.index == index ? mainColor : Colors.white,
                                                    child: Center(
                                                      child: LocaleText(
                                                        categoryNames[index],
                                                        style: TextStyle(
                                                          color: this.index == index ? Colors.white : mainColor,
                                                          fontFamily: mainFont,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )
              : Container();
        });
  }
}
