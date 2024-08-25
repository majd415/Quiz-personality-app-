import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/controler/onBoardingController.dart';
import 'package:zaid_mohamed_test/data/data_scorce/static/staticdata.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingContrillerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller:controller.pageController ,
        onPageChanged: (value){
        controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,



        itemBuilder: (context,i)=>Column(
          children: [
            Container(
              width: 200,
                height: 200,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "${onBoardingList[i].image}",
                  ),
                )),
            Container(
              child: Text(
                "${onBoardingList[i].title}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Ciro',
                    fontSize: 25,
                    letterSpacing: -0.3333333432674408,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ),
          ],
        ));
  }
}


// Expanded(
// flex: 3,
// child: Container(
// child: Image(
// fit: BoxFit.fill,
// image: AssetImage(
// "${onBoardingList[i].image}",
// ),
// )),
// ),
// Expanded(
// flex: 2,
// child: Container(
// child: Text(
// "${onBoardingList[i].title}",
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Color.fromRGBO(255, 255, 255, 1),
// fontFamily: 'Ciro',
// fontSize: 35,
// letterSpacing: -0.3333333432674408,
// fontWeight: FontWeight.bold,
// height: 1.5),
// ),
// ),
// ),