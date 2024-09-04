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

abstract class ResultController extends GetxController{

}

class ResultControllerImp extends ResultController{

 late List<String> finalResultList;
 late List<double> finalResultPercentageList=[];
 late List<String> finalResultLink = [];

 late double progress ;

 late AudioPlayer audioPlayer;
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


 void playAudio() async {
   await audioPlayer.play(AssetSource('sounds/result.wav'));
 }

 void stopAudio() async {
   await audioPlayer.stop();
 }
  @override
  onInit() async {
  statusRequest=StatusRequest.loading;
    await   getfituresfunc();
      finalResultList = Get.arguments["finalResult"];
      finalResultPercentageList = Get.arguments["finalResultPercentage"];
  finalResultLink = Get.arguments["finalResultLink"];

  update();



  audioPlayer = AudioPlayer();
    playAudio();
  // addResultToDatabase();
    update();
    super.onInit();
  }



 openNegativePdf(){
   if(finalResultLink[0]=="المسيطر" ){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');


     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }



   }
   else if(finalResultLink[0]=="المؤثر"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="المستقر"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="الحذر"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="DI"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="DS"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="DC"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="ID"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="IS"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="IC"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="SD"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="SI"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="SC"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="CD"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="CI"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="CS"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/negantiveEN.pdf');

     }

   }

 }

 openPositevPdf(){
   if(finalResultLink[0]=="المسيطر" ){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }



   }
   else if(finalResultLink[0]=="المؤثر"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="المستقر"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="الحذر"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="DI"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');
//https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/DI/positiveAR.pdf
     }else{

         launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');


     }

   }
   else if(finalResultLink[0]=="DS"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="DC"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="ID"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="IS"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="IC"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="SD"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="SI"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="SC"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');
//https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/SC/positiveAR.pdf
     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="CD"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="CI"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }
   else if(finalResultLink[0]=="CS"){
     if (Get.locale?.languageCode == 'ar'){
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveAR.pdf');

     }else{
       launch('${LinkApp.pdfresult}${finalResultLink[0]}/positiveEN.pdf');

     }

   }

 }






 @override
 void onClose() {
   stopAudio();
   audioPlayer.dispose();
   super.onClose();
 }

}



