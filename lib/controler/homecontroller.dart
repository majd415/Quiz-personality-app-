import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';


import '../core/class/statusrequest.dart';
import '../core/functions/handlinDataController.dart';
import '../core/services/services.dart';
import '../data/data_scorce/remote/addresultdata.dart';

abstract class HomeController extends GetxController{

}
class HomeControllerImp extends HomeController {

  MysServices mysServices =Get.find();
  AddResult addResult= AddResult(Get.find());


  List results=[];





  late StatusRequest statusRequest;

  getResultdata()async{
    results.clear();
    statusRequest=StatusRequest.loading;

    var response=await addResult.getResults(mysServices.sharedPreferences.getString("id")!);
    statusRequest=handlingData(response);

    if(StatusRequest.success==statusRequest){
      if(response['status'] == "success"){
        results.addAll(response['data']);
print("results home ${results}");
      }else{
        statusRequest=StatusRequest.success;
      }

    }else{
      statusRequest=StatusRequest.success;


    }
    update();

  }

  gotoprofileresult(index){

    Get.toNamed(AppRoute.resultprofile,arguments: {
      "result":results[index]["personality_type"],
    });
    print(results[index]["personality_type"]);
  }



@override
  void onInit() async{
  await getResultdata();
  super.onInit();
  }

}
