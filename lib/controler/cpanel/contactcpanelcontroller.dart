

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../core/services/services.dart';
import '../../data/data_scorce/remote/auth/signup.dart';
import '../../data/data_scorce/remote/cpanel/contactdatacpanel.dart';
import '../../data/data_scorce/remote/cpanel/usersdataCpanel.dart';

abstract class ContactCpanelController extends GetxController {
  updateContact();

}
class ContactCpanelControllerImp extends ContactCpanelController {


  late TextEditingController whatsapp;
  late TextEditingController email;
  late TextEditingController phone;


  GlobalKey<FormState> formStatesUpadeteContactCpanel = GlobalKey<FormState>();

  StatusRequest? statusRequest;
  ContactDataCpanel contactDataCpanel= ContactDataCpanel(Get.find());
  MysServices mysServices = Get.find();

  List data=[];




  @override
  updateContact() async {
    // هي الطريقة لحتا ما كل مرة نعمل انستانس من كلاس crud ونمررو لهيك شوف ال initial_binding و
    var formdata=formStatesUpadeteContactCpanel.currentState;
    if(formdata!.validate()){
      statusRequest = StatusRequest.loading;
      update();

      var response = await contactDataCpanel.updateContactDataCpanel(email.text,phone.text,whatsapp.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          getContactsdatacpanel();
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
  getContactsdatacpanel()async{

    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await contactDataCpanel.getContactCpanel();
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






  @override
  void onInit() {


    email = TextEditingController();
    phone= TextEditingController();

    whatsapp = TextEditingController();

    getContactsdatacpanel();
    super.onInit();


  }

  @override
  void dispose() {



    email.dispose() ;
    phone .dispose() ;

    whatsapp.dispose() ;
    super.dispose();

  }


}