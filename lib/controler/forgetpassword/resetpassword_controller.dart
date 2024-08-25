import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../data/data_scorce/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}
class ResetPasswordControllerImp extends ResetPasswordController  {

  late TextEditingController password;
  late TextEditingController repassword;
   ResetPasswordForgetPasswordData passwordForgetPasswordData =ResetPasswordForgetPasswordData(Get.find());
  StatusRequest? statusRequest;
  String? email;
  GlobalKey<FormState> formState=GlobalKey<FormState>();

  @override
  goToSuccessResetPassword()async {

    if(password.text !=repassword.text) return Get.defaultDialog(title: "warning",middleText: "password not match");
    var formdata=formState.currentState;
    if(formdata!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      var response=await passwordForgetPasswordData.postData(email! ,  password.text, );
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetPasword);

        }else{
          Get.defaultDialog(title: "warning",middleText: " try again   ");
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
  resetPassword() {



  }


  @override
  void onInit() {
    password=TextEditingController();
    repassword=TextEditingController();
    email=Get.arguments['email'];




    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();


    super.dispose();
  }

}