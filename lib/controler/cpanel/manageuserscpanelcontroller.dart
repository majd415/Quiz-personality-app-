

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../core/services/services.dart';
import '../../data/data_scorce/remote/auth/signup.dart';
import '../../data/data_scorce/remote/cpanel/usersdataCpanel.dart';

abstract class ManageUsersCpanelController extends GetxController {
  signup();
  updateUser();

}
class ManageUsersCpanelControllerImp extends ManageUsersCpanelController {


  late TextEditingController emailAdd;
  late TextEditingController usernameAdd;
  late TextEditingController phoneAdd;
  late TextEditingController passwordAdd;
  late TextEditingController emailUpdate;
  late TextEditingController usernameUpdate;
  late TextEditingController phoneUpdate;
  late TextEditingController passwordUpdate;
  late TextEditingController idUserUpdate;

  GlobalKey<FormState> formStateAddNewUserCpanel = GlobalKey<FormState>();
  GlobalKey<FormState> formStatesUpadeteUserCpanel = GlobalKey<FormState>();

  StatusRequest? statusRequest;
  UsersDtataCpanel NewUserCpanelData= UsersDtataCpanel(Get.find());
  MysServices mysServices = Get.find();

  List data=[];

  @override
  signup()async {
    var formdata=formStateAddNewUserCpanel.currentState;
    if(formdata!.validate()){

      statusRequest=StatusRequest.loading;
      update();
      var response=await NewUserCpanelData.addNewUserCpanel(usernameAdd.text, passwordAdd.text, emailAdd.text, phoneAdd.text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){
          //data.addAll(response['data']);
          getusersdatacpanel();

          update();

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


  updateUser() async {
    // هي الطريقة لحتا ما كل مرة نعمل انستانس من كلاس crud ونمررو لهيك شوف ال initial_binding و
    var formdata=formStatesUpadeteUserCpanel.currentState;
    if(formdata!.validate()){
      statusRequest = StatusRequest.loading;
      update();

      var response = await NewUserCpanelData.updateUserDataCpanel(idUserUpdate.text,usernameUpdate.text,passwordUpdate.text,emailUpdate.text,phoneUpdate.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          getusersdatacpanel();
          update();




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
  getusersdatacpanel()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await NewUserCpanelData.getallusersCpanel();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        data.addAll(response['data']);



      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }
  deleteUsersdatacpanel(String id)async{
    statusRequest = StatusRequest.loading;
    update();

    var response = await NewUserCpanelData.deleteUserDataCpanel(id);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getusersdatacpanel();

        Get.snackbar('Success','delete',
            backgroundColor:Colors.greenAccent);
        update();



      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }






  @override
  void onInit() {
    emailUpdate = TextEditingController();
    passwordUpdate = TextEditingController();
    phoneUpdate = TextEditingController();

    usernameUpdate = TextEditingController();
    idUserUpdate = TextEditingController();

    emailAdd = TextEditingController();
    passwordAdd = TextEditingController();
    phoneAdd = TextEditingController();

    usernameAdd = TextEditingController();
    getusersdatacpanel();

    super.onInit();


  }

  @override
  void dispose() {

    emailUpdate.dispose() ;
    passwordUpdate.dispose() ;
    phoneUpdate.dispose() ;

    usernameUpdate.dispose() ;
    idUserUpdate .dispose() ;

    emailAdd.dispose() ;
    passwordAdd .dispose() ;
    phoneAdd .dispose() ;

    usernameAdd.dispose() ;
    super.dispose();

  }


}