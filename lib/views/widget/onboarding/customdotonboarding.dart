import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:zaid_mohamed_test/controler/onBoardingController.dart';
import 'package:zaid_mohamed_test/data/data_scorce/static/staticdata.dart';

class CustomDotOnboarding extends StatelessWidget {
  const CustomDotOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingContrillerImp>(
      builder: (controller) => Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(

                  margin: const EdgeInsets.only(right: 5),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(

                      color: controller.currentPage == index
                          ? Color.fromRGBO(0, 0, 0, 1)
                          : Color.fromRGBO(255, 243, 243, 1),
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  duration: const Duration(microseconds: 900),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
