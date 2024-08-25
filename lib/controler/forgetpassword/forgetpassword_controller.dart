import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../data/data_scorce/remote/forgetpassword/chechemail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}
class ForgetPasswordControllerImp extends ForgetPasswordController {
   CheckEmailForgetPasswordData checkEmailForgetPasswordData = CheckEmailForgetPasswordData(Get.find());
  late TextEditingController email;
  GlobalKey<FormState> formState=GlobalKey<FormState>();
  StatusRequest? statusRequest  ;

  @override
  checkEmail() async{

    var formdata=formState.currentState;
    if(formdata!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      var response=await checkEmailForgetPasswordData.postData(email.text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.verefiyCode,arguments: {
            "email":email.text
          });

        }else{
          Get.defaultDialog(title: "warning",middleText: " email not found ");
          statusRequest=StatusRequest.failure;
        }

      }
      update();
      return "valid";
    }else{
      return "not valid ";

    }




  }


  @override
  void onInit() {
    email=TextEditingController();




    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }


}