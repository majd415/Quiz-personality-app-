import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp(){

   Get.defaultDialog(

    title: "تنبية",
    middleText: "هل تريد الخروج من التطبيق ",
    actions: [

      ElevatedButton(
          onPressed: (){
            exit(0);
          },
          child: const Text("نعم")),
      ElevatedButton(
          onPressed: (){
            Get.back();
          },
          child: const Text("تراجع")),
    ]
  );
return Future.value(true);

}