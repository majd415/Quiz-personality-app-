

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../data/data_scorce/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
}
class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
   VerifyCodeSignUpData verifyCodeSignUpData=VerifyCodeSignUpData(Get.find());
  String? email;
  StatusRequest? statusRequest;

  @override
  checkCode() {

  }

  @override
  goToSuccessSignUp(String verificationCode) async{

    statusRequest=StatusRequest.loading;
    update();
    var response=await verifyCodeSignUpData.postData( email!, verificationCode);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
      if(response['status'] == "success"){
        Get.offNamed(AppRoute.successSignUp);


      }else{
        Get.defaultDialog(title: "warning",middleText: "verify code not correct ");
        statusRequest=StatusRequest.failure;
      }

    }
    update();

  }


  resend(){
     verifyCodeSignUpData.resendData( email!);

  }
  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }


}