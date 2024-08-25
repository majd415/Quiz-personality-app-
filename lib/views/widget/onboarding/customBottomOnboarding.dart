import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controler/onBoardingController.dart';

class CustomBottomOnboarding extends GetView<OnBoardingContrillerImp> {
  const CustomBottomOnboarding({super.key});
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment:Get.locale?.languageCode == 'ar'? MainAxisAlignment.start :MainAxisAlignment.end ,
      children: [
        IconButton(
            onPressed: () {
              controller.next();
            },
            icon: Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
              size: 70,
            ))
      ],
    );
  }
}
