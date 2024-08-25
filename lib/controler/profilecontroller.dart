



import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';
import 'package:zaid_mohamed_test/core/services/services.dart';
import 'package:zaid_mohamed_test/data/data_scorce/static/staticdata.dart';

import '../core/functions/handlinDataController.dart';
import '../data/data_scorce/remote/addresultdata.dart';
import '../data/data_scorce/remote/auth/updateuserdata.dart';

abstract class ProfileController extends GetxController{

}

class ProfileControllerImp extends ProfileController{

  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  late StatusRequest statusRequest;
  UpdateUserData updateUserData = UpdateUserData(Get.find());
  MysServices mysServices=Get.find();
  GlobalKey<FormState> formStateprofile = GlobalKey<FormState>();





  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();

    username = TextEditingController();
    statusRequest=StatusRequest.success;
    update();
    super.onInit();
  }

  updateUser() async {
    // هي الطريقة لحتا ما كل مرة نعمل انستانس من كلاس crud ونمررو لهيك شوف ال initial_binding و
    var formdata=formStateprofile.currentState;
    if(formdata!.validate()){
    statusRequest = StatusRequest.loading;
    update();

    var response = await updateUserData.postData(mysServices.sharedPreferences.getString("id")!,username.text,password.text,mysServices.sharedPreferences.getString("email")!,phone.text);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        mysServices.sharedPreferences
            .setString("username", username.text);

        mysServices.sharedPreferences
            .setString("email", email.text);
        mysServices.sharedPreferences
            .setString("phone", phone.text);
        mysServices.sharedPreferences
            .setString("password", password.text);




      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
    return "valid";


    }else{


      return "not valid";
    }

  }





  @override
  void onClose() {

    super.onClose();
  }

}



