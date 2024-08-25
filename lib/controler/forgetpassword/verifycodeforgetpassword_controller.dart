


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../data/data_scorce/remote/forgetpassword/verficode.dart';

abstract class VerifyCodeControllerForgetPassword extends GetxController {
  checkCode();
  goToResetPasword(String verificationCode);
}
class VerifyCodeControllerForgetPasswordImp extends VerifyCodeControllerForgetPassword {
   VerfiyCodeForgetPasswordData codeForgetPasswordData = VerfiyCodeForgetPasswordData(Get.find());
  String? email;
  StatusRequest? statusRequest;

  @override
  checkCode() {

  }

  @override
  goToResetPasword(String verificationCode)async {
    statusRequest=StatusRequest.loading;
    update();
    var response=await codeForgetPasswordData.postData( email!,verificationCode);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
      if(response['status'] == "success"){
        Get.offNamed(AppRoute.resetPassword,arguments: {
          "email":email
        });


      }else{
        Get.defaultDialog(title: "warning",middleText: "verify code not correct ");
        statusRequest=StatusRequest.failure;
      }

    }
    update();

  }

  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }


}