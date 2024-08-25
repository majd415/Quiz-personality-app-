import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../data/data_scorce/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signup();
  toSignIn();

}
class SignUpControllerImp extends SignUpController {


  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formStatesignup = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  SignupData signupData= SignupData(Get.find());

  List data=[];

  @override
  signup()async {
    var formdata=formStatesignup.currentState;
    if(formdata!.validate()){

      statusRequest=StatusRequest.loading;
      update();
      var response=await signupData.postData(username.text, password.text, email.text, phone.text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.verifycodesignup,arguments: {
            "email":email.text,
          });

        }else{
          Get.defaultDialog(title: "warning",middleText: "phone number or email already exists ");
          statusRequest=StatusRequest.failure;
        }

      }
      update();



      return "valid";


    }else{


      return "not valid";
    }




  }

  @override
  toSignIn() {

    Get.offNamed(AppRoute.login);


  }






  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();

    username = TextEditingController();


    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    password.dispose();
    email.dispose();

    super.dispose();
  }


}