import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/localizition/changelocal.dart';
import '../widget/language/custombottonlang.dart';

class Language extends GetView<LocalControler> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.context!.width;

    return Scaffold(

      body:Container(
        padding:const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,style: Theme.of(context).textTheme.displayLarge,),
            const SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection:  Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    width: screenWidth > 600?300:350,

                    child: CustomBottonLang(textbutton: "Ar",
                      onPressed: (){
                        controller.changeLang("ar");
                        Get.toNamed(AppRoute.onboarding);
                      },),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),

            // SingleChildScrollView(
            //   scrollDirection:  Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //
            //     children: [
            //       Container(
            //         width: screenWidth > 600?300:350,
            //
            //         child: CustomBottonLang(textbutton: "En",
            //           onPressed: (){
            //             controller.changeLang("en");
            //             Get.toNamed(AppRoute.onboarding);
            //
            //           },),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ) ,
    );
  }
}
