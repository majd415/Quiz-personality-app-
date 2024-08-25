

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlinDataController.dart';
import '../../core/services/services.dart';
import '../../data/data_scorce/remote/auth/signup.dart';
import '../../data/data_scorce/remote/cpanel/contactdatacpanel.dart';
import '../../data/data_scorce/remote/cpanel/paymentsCpanel.dart';
import '../../data/data_scorce/remote/cpanel/usersdataCpanel.dart';

abstract class PaymentsCpanelController extends GetxController {

}
class PaymentsCpanelControllerImp extends PaymentsCpanelController {


  late TextEditingController code;
  late TextEditingController amount;
  late TextEditingController endamount;
//controoler for edit info paypal

  late TextEditingController clientIdcontroller;
  late TextEditingController clientSecretcontrooler;
  late TextEditingController liveModecontrooler;

  GlobalKey<FormState> formStatesAddCoponCpanel = GlobalKey<FormState>();
  GlobalKey<FormState> formStatesendamountCpanel = GlobalKey<FormState>();
  GlobalKey<FormState> formStatesPaypalInfoCpanel = GlobalKey<FormState>();

  StatusRequest? statusRequest;
  PaymentsCpanel paymentsCpanel= PaymentsCpanel(Get.find());
  MysServices mysServices = Get.find();

  List datapayments=[];
  List datacopon=[];
  List endamountList=[];
  List paypalInfoCpanel=[];





  addCopon() async {
    // هي الطريقة لحتا ما كل مرة نعمل انستانس من كلاس crud ونمررو لهيك شوف ال initial_binding و
    var formdata=formStatesAddCoponCpanel.currentState;
    if(formdata!.validate()){
      statusRequest = StatusRequest.loading;
      update();

      var response = await paymentsCpanel.addNewCoponCpanel(code.text,amount.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          getAllCoponsdatacpanel();
          update();
          Get.snackbar('Success',"",
              backgroundColor:Colors.greenAccent          );



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





  getAllPeymentsdatacpanel()async{
    datapayments.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await paymentsCpanel.getallPaymentsCpanel();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        datapayments.addAll(response['data']);



      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }

  getAllCoponsdatacpanel()async{
    datacopon.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await paymentsCpanel.getallCoponsCpanel();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        datacopon.addAll(response['data']);



      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }




  deleteUsersdatacpanel(String id)async{
    statusRequest = StatusRequest.loading;
    update();

    var response = await paymentsCpanel.deleteCoponCpanel(id);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        Get.snackbar('Success','deleted',
            backgroundColor:  Colors.greenAccent);
        update();



      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }
  getAmountdatacpanel()async{
    endamountList.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await paymentsCpanel.getAmountCpanel();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        endamountList.addAll(response['data']);



      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }
  upadateendAmountCpanel( )async {
    var formdata=formStatesendamountCpanel.currentState;
    if(formdata!.validate()){

      statusRequest=StatusRequest.loading;
      update();
      var response=await paymentsCpanel.updateAmountCpanel(endamount.text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){
          Get.snackbar('Success',"",
              backgroundColor:Colors.greenAccent          );
          getAmountdatacpanel();

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
  getPayPalinfocpanel()async{
    paypalInfoCpanel.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await paymentsCpanel.getInfoPaypalCpanel();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        paypalInfoCpanel.addAll(response['data']);



      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }

  updatePaypalConnectionInfoCpanel( )async {
    var formdata=formStatesPaypalInfoCpanel.currentState;
    if(formdata!.validate()){

      statusRequest=StatusRequest.loading;
      update();
      var response=await paymentsCpanel.updateInfoPaypalCpanel(clientIdcontroller.text,clientSecretcontrooler.text,liveModecontrooler.text);
      statusRequest=handlingData(response);

      if(StatusRequest.success==statusRequest){
        if(response['status'] == "success"){
          Get.snackbar('Success',"",
              backgroundColor:Colors.greenAccent          );
          getAmountdatacpanel();

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


    code = TextEditingController();
    amount= TextEditingController();
     endamount=TextEditingController();
      clientIdcontroller=TextEditingController();
      clientSecretcontrooler=TextEditingController();
      liveModecontrooler=TextEditingController();
    getAllPeymentsdatacpanel();
    getAllCoponsdatacpanel();
    getAmountdatacpanel();
    getPayPalinfocpanel();
    super.onInit();


  }

  @override
  void dispose() {



    code.dispose() ;
    amount .dispose() ;
    endamount.dispose();
    super.dispose();

  }


}