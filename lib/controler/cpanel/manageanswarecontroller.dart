

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../core/services/services.dart';
import '../../data/data_scorce/remote/auth/signup.dart';
import '../../data/data_scorce/remote/cpanel/answareCpanel.dart';
import '../../data/data_scorce/remote/cpanel/usersdataCpanel.dart';

abstract class ManageAnswareCpanelController extends GetxController {


}
class ManageAnswareCpanelControllerImp extends ManageAnswareCpanelController {


  List<TextEditingController> artextControllers = [];
  List<TextEditingController> entextControllers = [];
  List<GlobalKey<FormState>> formKeys = [];


  // GlobalKey<FormState> formStatesUpadeteAnswareCpanel = GlobalKey<FormState>();
  GlobalKey<FormState> formStatesUpadeteMainQuestionCpanel = GlobalKey<FormState>();
 late TextEditingController mainquestionArControllers ;
  late TextEditingController mainquestionEnControllers ;
  List datamainquistion=[];


  StatusRequest? statusRequest;
  AnswareDataCpanel answareDataCpanel= AnswareDataCpanel(Get.find());
  MysServices mysServices = Get.find();

  List data=[];

  upadateArAnsware(int index,String id, )async {
    var formdata=formKeys[index].currentState;
    if(formdata!.validate()){

      statusRequest=StatusRequest.loading;
      update();
      var response=await answareDataCpanel.updateAnswareDataARCpanel(id, artextControllers[index].text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){


        }else{
          Get.defaultDialog(title: "warning",middleText: "there is a problem      ");
          statusRequest=StatusRequest.failure;
        }

      }
      update();



      return "valid";


    }else{


      return "not valid";
    }




  }
  upadateEnAnsware(int index,String id, )async {
    var formdata=formKeys[index].currentState;
    if(formdata!.validate()){

      statusRequest=StatusRequest.loading;
      update();
      var response=await answareDataCpanel.updateAnswareDataENCpanel(id, entextControllers[index].text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){


        }else{
          Get.defaultDialog(title: "warning",middleText: "there is a problem ");
          statusRequest=StatusRequest.failure;
        }

      }
      update();



      return "valid";


    }else{


      return "not valid";
    }




  }


  getallanswaresdatacpanel()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await answareDataCpanel.getallAnswareCpanel();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        data.addAll(response['data']);
        // إنشاء قائمة من المتحكمات بناءً على عدد البيانات المستلمة
        artextControllers = List.generate(data.length, (index) => TextEditingController());
        entextControllers = List.generate(data.length, (index) => TextEditingController());

        formKeys = List.generate(data.length, (index) => GlobalKey<FormState>());


      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }




  getMainQuestiondatacpanel()async{
    datamainquistion.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await answareDataCpanel.getMainQuestionCpanel();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        datamainquistion.addAll(response['data']);


      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }
  upadateArMainQuestion()async {
    var formdata=formStatesUpadeteMainQuestionCpanel.currentState;
    if(formdata!.validate()){

      statusRequest=StatusRequest.loading;
      update();
      var response=await answareDataCpanel.updateMainQuestionDataARCpanel(mainquestionArControllers.text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){


        }else{
          Get.defaultDialog(title: "warning",middleText: "there is a problem      ");
          statusRequest=StatusRequest.failure;
        }

      }
      update();



      return "valid";


    }else{


      return "not valid";
    }




  }
  upadateEnMainQuestion( )async {
    var formdata=formStatesUpadeteMainQuestionCpanel.currentState;
    if(formdata!.validate()){

      statusRequest=StatusRequest.loading;
      update();
      var response=await answareDataCpanel.updateMainQuestionDataEnCpanel(mainquestionEnControllers.text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){


        }else{
          Get.defaultDialog(title: "warning",middleText: "there is a problem      ");
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
  void onInit() {

    getMainQuestiondatacpanel();
    getallanswaresdatacpanel();
    mainquestionArControllers=TextEditingController() ;
    mainquestionEnControllers=TextEditingController() ;


    super.onInit();


  }

  @override
  void dispose() {

    for (var controller in artextControllers) {
      controller.dispose();
    }
    for (var controller in entextControllers) {
      controller.dispose();
    }

    super.dispose();

  }


}