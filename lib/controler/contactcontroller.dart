import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlinDataController.dart';
import '../core/services/services.dart';
import '../data/data_scorce/remote/contact.dart';

abstract class ContactController extends GetxController{

}

class ContactControllerImp extends ContactController{


  late StatusRequest statusRequest;

  MysServices mysServices=Get.find();
  late ContactData contactData=ContactData(Get.find());
  late List contactdata=[];

  getfituresfunc()async{

    contactdata.clear();
    statusRequest = StatusRequest.loading;

    var response = await contactData.getContactData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        contactdata.addAll(response['data']);

print(contactdata);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }


  late  String url ;

  void launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }



  @override
  void onInit() {
    getfituresfunc();


    super.onInit();
  }






}





