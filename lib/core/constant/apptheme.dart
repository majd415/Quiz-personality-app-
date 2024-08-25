import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeEnglish=ThemeData(
  fontFamily:"Ciro"  ,
  textTheme: const TextTheme(

    displayLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColor.black) ,
    displayMedium: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: AppColor.black) ,
    bodyLarge: TextStyle(height: 2,
        color: AppColor.gray,fontWeight: FontWeight.bold,fontSize: 16) ,
    bodyMedium: TextStyle(height: 2,
        color: AppColor.gray,fontSize: 14) ,

  ),
  appBarTheme: AppBarTheme(
    // color: AppColor.primaryColor

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic=ThemeData(
  fontFamily:"Ciro"  ,
  textTheme: const TextTheme(

    displayLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColor.black) ,
    displayMedium: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: AppColor.black) ,
    bodyLarge: TextStyle(height: 2,
        color: AppColor.gray,fontWeight: FontWeight.bold,fontSize: 16) ,
    bodyMedium: TextStyle(height: 2,
        color: AppColor.gray,fontSize: 14) ,

  ),
  primarySwatch: Colors.blue,
);