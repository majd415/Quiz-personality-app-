import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zaid_mohamed_test/apilink.dart';
import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';
import 'package:zaid_mohamed_test/core/services/services.dart';
import 'package:zaid_mohamed_test/data/data_scorce/static/staticdata.dart';

import '../core/functions/handlinDataController.dart';
import '../data/data_scorce/remote/addresultdata.dart';
import '../data/data_scorce/remote/showfitures.dart';

abstract class ResultControllerProfile extends GetxController{

}

class ResultControllerProfileImp extends ResultControllerProfile{


  late String finalResultLink="" ;
  late List<String> result = [];

  late double progress ;

  late StatusRequest statusRequest;
  MysServices mysServices=Get.find();
  late ShowFitures showFitures=ShowFitures(Get.find());
  List getfitures=[];

  getfituresfunc()async{

    getfitures.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await showFitures.getFitures();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getfitures.addAll(response['data']);
        // print("getfitures list ::::: ${getfitures}");



      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }





  @override
  onInit() async {
    statusRequest=StatusRequest.loading;
    await   getfituresfunc();
    finalResultLink=Get.arguments["result"];
    print(finalResultLink);
    update();



    super.onInit();
  }



  openNegativePdf(){
    if(finalResultLink=="المسيطر" ){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');


      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }



    }
    else if(finalResultLink=="المؤثر"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="المستقر"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="الحذر"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="DI"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="DS"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="DC"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="ID"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="IS"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="IC"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="SD"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="SI"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="SC"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="CD"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="CI"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }
    else if(finalResultLink=="CS"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/negantiveEN.pdf');

      }

    }

  }

  openPositevPdf(){
    if(finalResultLink=="المسيطر" ){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }



    }
    else if(finalResultLink=="المؤثر"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="المستقر"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="الحذر"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="DI"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');
//https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/DI/positiveAR.pdf
      }else{

        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');


      }

    }
    else if(finalResultLink=="DS"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="DC"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="ID"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="IS"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="IC"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="SD"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="SI"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="SC"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');
//https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/SC/positiveAR.pdf
      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="CD"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="CI"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }
    else if(finalResultLink=="CS"){
      if (Get.locale?.languageCode == 'ar'){
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveAR.pdf');

      }else{
        launch('${LinkApp.pdfresult}${finalResultLink}/positiveEN.pdf');

      }

    }

  }



@override
  void dispose() {

  result.clear();
    super.dispose();
  }


  @override
  void onClose() {
    super.onClose();
  }

}



