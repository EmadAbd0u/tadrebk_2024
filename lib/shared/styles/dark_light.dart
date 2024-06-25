import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/shared/fonts.dart';



import '../colors.dart';

class Styles {


  static ThemeData darkTheme(BuildContext context) {


    return ThemeData(
      useMaterial3: true,


      scaffoldBackgroundColor:   Colors.black,
      secondaryHeaderColor: mainColor,


      primaryColor: HexColor('#10A37F'),


      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.light()),


      iconTheme:  IconThemeData(
          color: mainColor
      ),


      textTheme:  TextTheme(
          titleLarge: TextStyle(fontSize: 12,fontFamily: mainFont, fontWeight: FontWeight.w700, color: mainColor),
          titleMedium: TextStyle(fontSize: 12, fontFamily: mainFont,fontWeight: FontWeight.w500, color: mainColor),
          bodyLarge: TextStyle(fontSize: 14,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontSize: 12,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w600),
          labelMedium: TextStyle(fontSize: 14,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w600),
          labelLarge: TextStyle(fontSize: 22,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w700),
          displayMedium: TextStyle(fontSize: 13,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w600),
          displayLarge: TextStyle(fontSize: 30,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w700),
    ),
    );
  }


  static ThemeData lightTheme(BuildContext context) {

    return ThemeData(
      useMaterial3: true,


      scaffoldBackgroundColor:  Colors.white,
      secondaryHeaderColor: Colors.grey,

      primaryColor:  HexColor('#10A37F'),



      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.light()),



      iconTheme: const IconThemeData(
          color: Colors.black
      ),


      textTheme:  TextTheme(
        titleLarge: TextStyle(fontSize: 12,fontFamily: mainFont, fontWeight: FontWeight.w700, color: mainColor),
        titleMedium: TextStyle(fontSize: 12, fontFamily: mainFont,fontWeight: FontWeight.w500, color: mainColor),
        bodyLarge: TextStyle(fontSize: 14,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w500),
        displayLarge: TextStyle(fontSize: 30,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(fontSize: 12,fontFamily: mainFont, color:Colors.black, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(fontSize: 14,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w600),
        labelLarge: TextStyle(fontSize: 22,fontFamily: mainFont, color:mainColor, fontWeight: FontWeight.w700),
        displayMedium:  TextStyle(fontSize: 13,fontFamily: mainFont, color:Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
