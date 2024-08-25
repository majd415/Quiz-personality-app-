import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';
import 'package:zaid_mohamed_test/core/services/services.dart';
import 'package:zaid_mohamed_test/data/data_scorce/static/staticdata.dart';

abstract class OnBoardingContriller extends GetxController{
next();
onPageChanged(int x);
}

class OnBoardingContrillerImp extends OnBoardingContriller{

late PageController pageController;
  int currentPage=0;
  MysServices mysServices=Get.find();


  @override
  next() {
    currentPage++;


    if(currentPage > onBoardingList.length-1){
      mysServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);

    }else{
      pageController.animateToPage(currentPage, duration: const Duration(microseconds: 900), curve:Curves.easeInExpo);

    }

  }


  @override
  onPageChanged(int index) {
    currentPage=index;
    update();
  }
  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }


}