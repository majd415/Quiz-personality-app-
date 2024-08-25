import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controler/auth/sucesssignup_controoler.dart';
import '../../widget/auth/custombuttomauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SucessSignUpControllerImp controller=Get.put(SucessSignUpControllerImp());
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
              child: CustomButtomAuth(text:'50'.tr,onPressed: (){
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
