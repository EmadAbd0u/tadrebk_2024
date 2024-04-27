

import 'package:flutter/material.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/login_screen/login.dart';

import '../shared/colors.dart';
import '../shared/components.dart';
import '../shared/fonts.dart';

class RestPasswordCode extends StatefulWidget {
  const RestPasswordCode({super.key});

  @override
  State<RestPasswordCode> createState() => _RestPasswordCodeState();
}

class _RestPasswordCodeState extends State<RestPasswordCode> {

  final _formKey = GlobalKey<FormState>();
  bool isCorrect = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height*0.6,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.height*0.44,

                    child: Card(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                            child: Text('Enter security code',

                              style: TextStyle(
                                  fontFamily: mainFont
                              ),

                            ),
                          ),
                         isCorrect == true ? Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,),
                            child: Text('Not correct security code',

                              style: TextStyle(
                                  fontFamily: mainFont,
                                color: Colors.red,
                              ),

                            ),
                          ) : Container(),
                          Divider(),
                          Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Please check your emails for a message withe your code .your code is 6 numbers long',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: mainFont,

                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: TextEditingController(),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'this field is empty';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        hintText: 'Enter code',

                                        hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                                        focusColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(

                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(

                                          borderSide: BorderSide(
                                            color:Colors.grey,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(

                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(

                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
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
                          Divider(),

                          Spacer(),


                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20,
                                right: 20
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,

                              children: [


                                InkWell(
                                  onTap:(){

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context){
                                          return Login();
                                        })
                                    );

                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.08,
                                    height:MediaQuery.of(context).size.height*0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.withOpacity(0.8),

                                    ),

                                    child: Center(
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontFamily: mainFont,
                                            fontSize: 16
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: (){

                                    if (_formKey.currentState!.validate()) {
                                      setState(() {

                                        isCorrect = true;

                                      });
                                    }

                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.08,
                                    height:MediaQuery.of(context).size.height*0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: mainColor,

                                    ),

                                    child: Center(
                                      child: Text(
                                        'continue',
                                        style: TextStyle(
                                            fontFamily: mainFont,
                                            fontSize: 16,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
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
    );
  }
}
