import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/controler/onBoardingController.dart';

import '../widget/onboarding/customBottomOnboarding.dart';
import '../widget/onboarding/customdotonboarding.dart';
import '../widget/onboarding/customslideronboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingContrillerImp());
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(22, 217, 227, 1),
                Color.fromRGBO(35, 208, 231, 1),
                Color.fromRGBO(48, 199, 236, 1)
              ]),
        ),
        child: Column(

          children: [
              SizedBox(height: 70,),
            Expanded(
              flex: 6,
                child: CustomSliderOnBoarding()),
             Expanded(
               flex: 1,
                 child: CustomDotOnboarding()),
            Expanded(
              flex: 1,
                child: CustomBottomOnboarding())


          ],
        ),
      ),
    );
  }
}

// Figma Flutter Generator Splashscreen1Widget - FRAME
