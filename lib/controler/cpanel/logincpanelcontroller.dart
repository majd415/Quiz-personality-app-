import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlinDataController.dart';
import '../../core/services/services.dart';
import '../../data/data_scorce/remote/auth/login.dart';
import '../../data/data_scorce/remote/cpanel/logindatacoanel.dart';

abstract class LoginCpanelController extends GetxController {
  login();
}
class LoginCpanelControllerImp extends LoginCpanelController {
  LoginDataCpanel loginDatacpanel = LoginDataCpanel(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formStatecpanel=GlobalKey<FormState>();
  bool isShowPassword = true;
  StatusRequest? statusRequest;
  MysServices mysServices = Get.find();




  showPassword(){
    isShowPassword= isShowPassword==true?false:true;
    update();

  }


  @override
  login()async {
    var formdata = formStatecpanel.currentState;

    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginDatacpanel.logindatacpanel(
        email.text,
        password.text,
      );
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.cpanelScreen);

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