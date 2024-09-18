import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/constant/apptheme.dart';

import '../services/services.dart';

class LocalControler extends GetxController{

  Locale? language;

ThemeData appTheme=themeEnglish;

  MysServices mysServices =Get.find();
changeLang(String langcode){
Locale locale =Locale(langcode);
mysServices.sharedPreferences.setString("lang", langcode);
// appTheme=langcode=="ar" ?themeArabic:themeEnglish;
// Get.changeTheme(appTheme);
Get.updateLocale(locale);

}

@override
  void onInit() {
  String? sharedPrefLang=mysServices.sharedPreferences.getString("lang");
   if(sharedPrefLang=="ar"){
     language=const Locale("ar");
     // appTheme=themeArabic;
   }else if(sharedPrefLang=="en"){
     language=const Locale("en");
     // appTheme=themeEnglish;

   }else{
     language= Locale(Get.deviceLocale!.languageCode);

     // appTheme=themeEnglish;//default value

   }
   


    super.onInit();
  }



}