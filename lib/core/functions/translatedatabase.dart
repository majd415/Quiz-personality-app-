import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/services/services.dart';

translatedatabase(columnar,columnen){
  MysServices mysServices=Get.find();
  if(mysServices.sharedPreferences.getString("lang")=="ar"){
return columnar;

  }else{
    return columnen;

  }

}