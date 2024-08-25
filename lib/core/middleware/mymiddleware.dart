import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';
import 'package:zaid_mohamed_test/core/services/services.dart';

class MyMiddleware extends GetMiddleware{

  @override
  int? get priority=> 1;
  MysServices mysServices=Get.find();
@override
  RouteSettings? redirect(String? route){
  if(mysServices.sharedPreferences.getString("step") =="2" ){
    return const RouteSettings(name: AppRoute.home);
  }
if(mysServices.sharedPreferences.getString("step") =="1" ){
return const RouteSettings(name: AppRoute.login);
}

return null;
}
}