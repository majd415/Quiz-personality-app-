import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/screen/accountscreen.dart';
import '../../views/screen/contactus.dart';
import '../../views/screen/cpanel/firstpage.dart';
import '../../views/screen/cpanel/manageContact.dart';
import '../../views/screen/cpanel/manageFetures.dart';
import '../../views/screen/cpanel/manage_users.dart';
import '../../views/screen/cpanel/manageanswarequestion.dart';
import '../../views/screen/cpanel/managepayments.dart';
import '../../views/screen/cpanel/manageresultfile.dart';
import '../../views/screen/cpanel/statistics.dart';
import '../../views/screen/home.dart';
import '../../views/screen/statisticscreen.dart';



abstract class CpanelScreenController extends GetxController{
  changePage(int i);


}

class CpanelScreenControllerImp extends CpanelScreenController{



  int currentpage=0;
  List<Widget> listPage=[

    FirstPageCpanel(),
    ManageUsers(),
    ManageContact(),
    ManageFetures(),
    Managepayments(),
    Manageresultfile(),
    StatisticsCpanel(),
    ManageAnswareAndQuestion()


  ];
  // List titlebuttonappbar=[
  //   "الرئيسية",
  //   "الاحصائيات",
  //   "تواصل معنا",
  //   "الحساب"
  //
  // ];

  // List<IconData> iconbuttonappbar=[
  //   Icons.home,
  //   Icons.analytics_outlined,
  //   Icons.contact_page,
  //   Icons.person
  //
  // ];






  @override
  changePage(int i) {
    currentpage=i;
    update();

  }


}