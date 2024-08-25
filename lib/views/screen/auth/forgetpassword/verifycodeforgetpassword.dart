import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controler/forgetpassword/verifycodeforgetpassword_controller.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {

    VerifyCodeControllerForgetPasswordImp controller=Get.put(VerifyCodeControllerForgetPasswordImp());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomTextTitleAuth(title: "كود التحقق"),
            const SizedBox(
              height: 10,
            ),

      
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
      
              borderColor: const Color(0xFFD9D9D9),
      //set to true to show as box or false to show as dash
              showFieldAsBox: true,
      //runs when a code is typed in
              onCodeChanged: (String code) {
      //handle validation or checks here
              },
      //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPasword(verificationCode);
              }, // end onSubmit
            ),

      //  CustomButtomAuth(text: "Check",onPressed: (){}),
            const SizedBox(
              height: 20,
            ),
            Text("ادخل الرمز الذي تم ارسالة الى البريد الاكتروني الذي قمت باضافتة ",
                textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Ciro',
                    fontSize: 13,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                )
            )
          ],
        ),
      ),
    );
  }
}

// const CustomTextBodyAuth(
// text: "please enter your digit code send to goopstoot@gmail.com"),
// const SizedBox(
// height: 65,
// ),

// Figma Flutter Generator Group10Widget - GROUP
