import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/screen/accountscreen.dart';
import '../views/screen/contactus.dart';
import '../views/screen/home.dart';
import '../views/screen/statisticscreen.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int i);


}

class HomeScreenControllerImp extends HomeScreenController{



  int currentpage=0;
  List<Widget> listPage=[
    // Home(),
    // Settings(),
  Home(),
    StatisticScreen(),
    ContactUs(),
    AccountScreen(),


  ];
  List titlebuttonappbar=[
    '2'.tr,
    '3'.tr,
    '4'.tr,
    '5'.tr

  ];

  List<IconData> iconbuttonappbar=[
    Icons.home,
    Icons.analytics_outlined,
    Icons.contact_page,
    Icons.person

  ];






  @override
  changePage(int i) {
    currentpage=i;
    update();

  }


}