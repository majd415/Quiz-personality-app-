import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlinDataController.dart';
import '../../core/services/services.dart';
import '../../data/data_scorce/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  toSignUp();
  goToForgetPassword();
}
class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState=GlobalKey<FormState>();
  bool isShowPassword = true;
  StatusRequest? statusRequest;
  MysServices mysServices = Get.find();




  showPassword(){
    isShowPassword= isShowPassword==true?false:true;
    update();

  }
  @override
  goToForgetPassword() {

  }

  @override
  login()async {
    var formdata = formState.currentState;

    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email.text,
        password.text,
      );
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          if (response['data']['users_approve' ]== "1") {
            mysServices.sharedPreferences
                .setString("id", response['data']["user_id"]);
            mysServices.sharedPreferences
                .setString("username", response['data']["user_name"]);

            mysServices.sharedPreferences
                .setString("email", response['data']["user_email"]);
            mysServices.sharedPreferences
                .setString("phone", response['data']["user_phone"]);
            mysServices.sharedPreferences
                .setString("password", response['data']["user_password"]);

            mysServices.sharedPreferences.setString("step", "2");

            Get.offNamed(AppRoute.home);
          } else {
            Get.offNamed(AppRoute.verifycodesignup, arguments: {
              "email": email.text,
            });
          }
        } else {
          Get.defaultDialog(
              title: "warning", middleText: " email or password not correct  ");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      // //لتفادي حفظ المعلومات بشكل دائم حتا عند الخروج من الصفحة لانة يحمل الذاكرة
      // Get.delete<SignUpController>();
      //use lazyput to another way
      return " valid";
    } else {
      return "not valid";
    }

  }

  @override
  toSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}