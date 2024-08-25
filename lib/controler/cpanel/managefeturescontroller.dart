

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../core/services/services.dart';
import '../../data/data_scorce/remote/auth/signup.dart';
import '../../data/data_scorce/remote/cpanel/contactdatacpanel.dart';
import '../../data/data_scorce/remote/cpanel/updatestatefetures.dart';
import '../../data/data_scorce/remote/cpanel/usersdataCpanel.dart';

abstract class FeturesCpanelController extends GetxController {

}
class FeturesCpanelControllerImp extends FeturesCpanelController {






  StatusRequest? statusRequest;
  ShowFituresCpanel showFituresCpanel= ShowFituresCpanel(Get.find());
  MysServices mysServices = Get.find();


  List data=[];




  updateShowfituriespositive(String positive) async {
    // هي الطريقة لحتا ما كل مرة نعمل انستانس من كلاس crud ونمررو لهيك شوف ال initial_binding و
      statusRequest = StatusRequest.loading;
      update();

      var response = await showFituresCpanel.showfituriespositive(positive);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {

          getFeturestsdatacpanel();



        }




      } else {
        statusRequest = StatusRequest.failure;
      }
      update();




  }


  updateShowfituriesNegative(String negative) async {
    // هي الطريقة لحتا ما كل مرة نعمل انستانس من كلاس crud ونمررو لهيك شوف ال initial_binding و
    statusRequest = StatusRequest.loading;
    update();

    var response = await showFituresCpanel.showfituriespositive(negative);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        getFeturestsdatacpanel();



      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();




  }




  getFeturestsdatacpanel()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await showFituresCpanel.getfituriesData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        data.addAll(response['data']);
print(data);


      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }






  @override
  void onInit() {


    getFeturestsdatacpanel();
    super.onInit();


  }

  @override
  void dispose() {




    super.dispose();

  }


}