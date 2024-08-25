import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MysServices extends GetxService {


  late SharedPreferences sharedPreferences;
  Future<MysServices> init() async{
    sharedPreferences=await SharedPreferences.getInstance();
    return this;
  }
}

initialServices()async{
  await Get.putAsync(() => MysServices().init());
}