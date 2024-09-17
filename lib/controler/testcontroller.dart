
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlinDataController.dart';
import '../core/services/services.dart';
import '../data/data_scorce/remote/addresultdata.dart';
import '../data/data_scorce/remote/getquestions.dart';
import '../data/data_scorce/remote/testdata.dart';

abstract class TestAppController extends GetxController {}

class TestAppControllerImp extends TestAppController {
  Testdata testdata = Testdata(Get.find());

  GetQuestionData questiondata = GetQuestionData(Get.find());

  int selectedIndex = -1;
  late double firstpos;
  late double endpos;
  int firstTrans = 0;
  late StatusRequest statusRequest;
  late List listdata = [];
  late List listpaypaldata = [];

  late List listquestiondata = [];

  late List<int> listdataPerC = [];
  late List<int> listdataPerS = [];
  late List<int> listdataPerI = [];
  late List<int> listdataPerD = [];

  List<String> finalResult = [];
  List<String> finalResultLink = [];

  List<double> finalResultPercentage = [];

  late AddResult addResult= AddResult(Get.find());

  MysServices mysServices=Get.find();

  late int count;
  late int groupAnswar;
  bool selectAnsware = false;

  late int ind;


  late AudioPlayer audioPlayer;
   addperResult(index)async{
    if (ind!=-1){
      if (index < 0 || index >= listdata.length) {
        print("Invalid index: $index");
        return;
      }else{
        print("list data add per result   ${ await listdata[index]}");
        if( listdata[index]["personality_id"]=="1"){
          int per1=  int.parse(listdata[index]["personality_id"]);
          listdataPerD.add(per1);
        }
        else if( listdata[index]["personality_id"]=="2"){

          int per2=  int.parse(listdata[index]["personality_id"]);
          listdataPerI.add(per2);
        }
        else if( listdata[index]["personality_id"]=="3"){
          int per3=  int.parse(listdata[index]["personality_id"]);
          listdataPerS.add(per3);

        }else if ( listdata[index]["personality_id"]=="4"){
          int per4=  int.parse(listdata[index]["personality_id"]);
          listdataPerC.add(per4);


        }
        print("list d  ${listdataPerD}");
        print("list i  ${listdataPerI}");
        print("list s  ${listdataPerS}");
        print("list c  ${listdataPerC}");


      }


    }else{

      print("first intro to new test");

    }









   }



  calculateResult() {
    finalResult.clear;
  List<List<int>> lists = [listdataPerD, listdataPerI, listdataPerS, listdataPerC];
  lists.sort((a, b) => b.length.compareTo(a.length)); // Sort lists by length in descending order

  List<int> longestList = lists[0];
  List<int> secondLongestList = lists[1];


  int totalLength = 27;

  // Calculate percentages for each list
  double percentLongestList = (longestList.length / totalLength) * 100;
  double percentSecondLongestList = (secondLongestList.length / totalLength) * 100;

  double difference = percentLongestList - percentSecondLongestList;
print("percentLongestList${percentLongestList}");
    print("percentSecondLongestList${percentSecondLongestList}");
    print("difference${difference}");

  if ( difference >= 1 && difference <= 20) {
    if(longestList[0]==1 &&secondLongestList[0]==2  ){
      finalResult.add("DI\n Dominant-Influencer \n المسيطر -المؤثر ");
      finalResultLink.add("DI");
      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);


    }
   else if(longestList[0]==1 &&secondLongestList[0]==3  ){
      finalResult.add("DS\n Dominant-Steady \n المسيطر - المستقر");
      finalResultLink.add("DS");
      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==1 &&secondLongestList[0]==4  ){
      finalResult.add("DC\n Dominant-Cautios \nالمسيطر - الحذر");
      finalResultLink.add("DC");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==2 &&secondLongestList[0]==1  ){
      finalResult.add("ID\n Influencer-Dominant\nالمؤثر - المسيطر");
      finalResultLink.add("ID");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==2 &&secondLongestList[0]==3  ){
      finalResult.add("IS\n Influencer-Steady\nالمؤثر - المستقر ");
      finalResultLink.add("IS");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==2 &&secondLongestList[0]==4  ){
      finalResult.add("IC\n Influencer-Cautios\nالمؤثر-الحذر");
      finalResultLink.add("IC");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==3 &&secondLongestList[0]==1  ){
      finalResult.add("SD\n Steady-Dominant\nالمستقر - المسيطر");
      finalResultLink.add("SD");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==3 &&secondLongestList[0]==2  ){
      finalResult.add("SI\n Steady-Influencer\nالمستقر - المؤثر");
      finalResultLink.add("SI");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==3 &&secondLongestList[0]==4  ){
      finalResult.add("SC\n Steady-Cautious\nالمستقر - الحذر");
      finalResultLink.add("SC");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==4 &&secondLongestList[0]==1  ){
      finalResult.add("CD\n Cautious-Dominant \nالحذر - المسيطر");
      finalResultLink.add("CD");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==4 &&secondLongestList[0]==2  ){
      finalResult.add("CI\n Cautious-Influencer\nالحذر -المؤثر");
      finalResultLink.add("CI");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }
    else if(longestList[0]==4 &&secondLongestList[0]==3  ){
      finalResult.add("CS\n Cautious-Steady \nالحذر - المستقر");
      finalResultLink.add("CS");

      finalResultPercentage.add(percentLongestList);
      finalResultPercentage.add(percentSecondLongestList);

    }

  } else {
    if(longestList[0]==1){
  finalResult.add("63".tr);
  finalResultLink.add("71".tr);

  finalResultPercentage.add(percentLongestList);
    }
   else if(longestList[0]==2){
      finalResult.add("64".tr);
      finalResultLink.add("72".tr);

      finalResultPercentage.add(percentLongestList);
    }
    else if(longestList[0]==3){
      finalResult.add("65".tr);
      finalResultLink.add("73".tr);

      finalResultPercentage.add(percentLongestList);
    }
    else if(longestList[0]==4){
      finalResult.add("66".tr);
      finalResultLink.add("74".tr);

      finalResultPercentage.add(percentLongestList);
    }
  }
    print("finalResult${finalResult}");

  // return finalResult;
  }
  transfarePos() {
    firstpos = 10;
    endpos = 10;
    update();
  }

  selectAnswarefunc(index) {
    ind = index;
    selectedIndex = index;
    update();
  }
  addResultToDatabase() async {
    // هي الطريقة لحتا ما كل مرة نعمل انستانس من كلاس crud ونمررو لهيك شوف ال initial_binding و

    statusRequest = StatusRequest.loading;
    update();

    var response = await addResult.postData(mysServices.sharedPreferences.getString("id")!,"1",finalResultLink[0].toString(),finalResultPercentage.length<2?"${finalResultPercentage[0]}":"${finalResultPercentage[0]}-${finalResultPercentage[1]}");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

// print("add result to database ${finalResult[0]}");

      }




    } else {
      statusRequest = StatusRequest.failure;
    }
    update();

  }
  getGroupAnsware(groupAnswar) async {
    // هي الطريقة لحتا ما كل مرة نعمل انستانس من كلاس crud ونمررو لهيك شوف ال initial_binding و
    selectedIndex = -1;
    // count++;
    transfarePos();
    selectAnsware = false;
    listdata.clear();
    statusRequest = StatusRequest.loading;

    var response = await testdata.postData(groupAnswar);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.addAll(response['data']);
        if(ind==0 || ind==1 || ind==2||ind==3){
           await  addperResult(ind);
            ind=-1;


            if(count==27){
              calculateResult();
              //////
              addResultToDatabase();
              /////////
              getpaypaldatacontroller();
              Get.toNamed(AppRoute.result,arguments: {

                  "finalResult":finalResult,
                  "finalResultPercentage":finalResultPercentage,
               "finalResultLink":finalResultLink,
                "papalInfo":listpaypaldata


                });



              stopAudio();


            }

        }else{
        }




        // print("print List getGroupAnsware${listdata}");
        print("ind test result for func${ind}");

        print("countttttttttttt :: ${count}");


      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  void playAudio() async {
    await audioPlayer.play(AssetSource('sounds/Meditating.wav'));
  }

  void stopAudio() async {
    await audioPlayer.stop();
  }
    nextAnsware() {
    groupAnswar++;
    update();
  }
  getpaypaldatacontroller()async{

    listpaypaldata.clear();
    statusRequest = StatusRequest.loading;

    var response = await testdata.getpaypalinfo();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listpaypaldata.addAll(response['data']);
print("getpaypaldatacontroller()");
print(listpaypaldata);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
  @override
  void onInit() {
    statusRequest = StatusRequest.loading;

    groupAnswar = 1;
    getmainQuestion();
    getGroupAnsware(groupAnswar);
    ind = -1;
    firstTrans = 1;
     count=0;
    listdataPerC.clear();
    listdataPerS.clear();
    listdataPerI.clear();
    listdataPerD.clear();
    finalResult.clear();
    finalResultPercentage.clear();
    finalResultLink.clear();
    audioPlayer = AudioPlayer();
    playAudio();
    audioPlayer.setReleaseMode(ReleaseMode.loop);  // ضبط التكرار التلقائي

    super.onInit();
  }
  @override
  void onClose() {
    stopAudio();
    audioPlayer.dispose();
    super.onClose();
  }



  getmainQuestion() async {

    listquestiondata.clear();
    statusRequest = StatusRequest.loading;

    var response = await questiondata.getquestiondata();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listquestiondata.addAll(response['data']);





        // print("print List getGroupAnsware${listdata}");





      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}




