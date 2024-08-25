import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controler/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttomauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(ResetPasswordControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller)=>
      controller.statusRequest==StatusRequest.loading?
      Center(child: CircularProgressIndicator(),)
          :
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 35),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              const SizedBox(height: 20,),
               CustomTextTitleAuth(title: '46'.tr),
              const SizedBox(height: 10,),
               CustomTextBodyAuth(text: '57'.tr),
              const SizedBox(height: 65,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth > 600?500:350,

                    child: CustomTextFormAuth(
                      isNumber: false,

                      mycontroller: controller.password,
                      hinttext: '45'.tr,
                      lable: '46'.tr,
                      iconData: Icons.lock_outline,
                      valid: (val){
                        return validInput(val!, 5, 30, "password");

                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth > 600?500:350,

                    child: CustomTextFormAuth(
                      isNumber: false,

                      mycontroller: controller.repassword,
                      hinttext: '58'.tr,
                      lable:'46'.tr,
                      iconData: Icons.lock_outline,
                      valid: (val){
                        return validInput(val!, 5, 30, "password");

                      },
                    ),
                  ),
                ],
              ),





              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth > 600?500:350,

                    child: CustomButtomAuth(text: '59'.tr,onPressed: (){
                      controller.goToSuccessResetPassword();
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 30,),





            ],
          ),
        ),
      )),
    );
  }
}
