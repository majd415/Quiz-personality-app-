import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controler/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttomauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(

      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller)=>
      controller.statusRequest==StatusRequest.loading ?
      Center(child: CircularProgressIndicator(),)
          :
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 35),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              const SizedBox(height: 20,),
               CustomTextBodyAuth(text:'54'.tr),
              const SizedBox(height: 65,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth > 600?500:350,

                      child: CustomTextFormAuth(
                        isNumber: false,

                        mycontroller: controller.email,
                        hinttext: '55'.tr,
                        lable: '42'.tr,
                        iconData: Icons.email_outlined,
                        valid: (val){
                          return validInput(val!, 5, 100, "email");

                        },
                      ),
                    ),
                  ],
                ),
              ),




              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth > 600?500:350,

                      child: CustomButtomAuth(text: '56'.tr,onPressed: (){
                        controller.checkEmail();
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),






            ],
          ),
        ),
      )),
    );
  }
}
