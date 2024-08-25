

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../core/services/services.dart';
import '../../data/data_scorce/remote/auth/signup.dart';
import '../../data/data_scorce/remote/cpanel/contactdatacpanel.dart';
import '../../data/data_scorce/remote/cpanel/statisticsCpanel.dart';
import '../../data/data_scorce/remote/cpanel/usersdataCpanel.dart';

abstract class StatisticsCpanelController extends GetxController {

}
class StatisticsCpanelControllerImp extends StatisticsCpanelController {





  StatusRequest? statusRequest;
  StatisticsCpanel statisticsCpanel= StatisticsCpanel(Get.find());
  MysServices mysServices = Get.find();

  List data=[];






  getuStatisticsdatacpanel()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await statisticsCpanel.getAllStatisticsCpanel();
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


    getuStatisticsdatacpanel();


    super.onInit();


  }

  @override
  void dispose() {




    super.dispose();

  }


}