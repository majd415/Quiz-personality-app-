import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controler/auth/verifycodesignup_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(VerifyCodeSignUpControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                       CustomTextTitleAuth(title: '51'.tr),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextBodyAuth(
                          text:
                          "${'52'.tr}  ${controller.email}"),
                      const SizedBox(
                        height: 65,
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                           width:   screenWidth > 600?500:350,
                              child: OtpTextField(
                                fieldWidth: 50.0,
                                borderRadius: BorderRadius.circular(20),
                                numberOfFields: 5,

                                borderColor: const Color(0xFF9F9BA3),
                              //set to true to show as box or false to show as dash
                                showFieldAsBox: true,
                              //runs when a code is typed in
                                onCodeChanged: (String code) {
                              //handle validation or checks here
                                },
                              //runs when every textfield is filled
                                onSubmit: (String verificationCode) {
                                  controller.goToSuccessSignUp(verificationCode);
                                }, // end onSubmit
                              ),
                            ),
                          ],
                        ),
                      ),

        //  CustomButtomAuth(text: "Check",onPressed: (){}),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          controller.resend();
                        },
                        child: Center(
                          child: Text(
                            '53'.tr,
                            style: TextStyle(
                              color: Color.fromRGBO(22, 217, 227, 1),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
