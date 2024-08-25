

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controler/forgetpassword/sucessresetpassword_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../widget/auth/custombuttomauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SucessResetPasswordControllerImp controller=Get.put(SucessResetPasswordControllerImp());

    return Scaffold(

      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Icon(Icons.check_circle_outline,size: 200,color: Color.fromRGBO(22, 217, 227, 1),)),
            const Text("............"),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(text: "الذهاب الى تسحيل الدخول ",onPressed: (){
                controller.goToPageLogIn();
              }),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
