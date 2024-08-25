import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controler/homescreen_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(builder: (controller)=>
        Scaffold(


          floatingActionButton:Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)

            ),

            child: FloatingActionButton(
              onPressed: (){
                Get.toNamed(AppRoute.testScreen);


              },
              backgroundColor:Color.fromRGBO(22, 217, 227, 1) ,
              child: Icon(Icons.add,
              color: Colors.white,),

            ),
          ) ,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomAppBarHome(),
          body:controller.listPage.elementAt(controller.currentpage) ,
        )

    );
  }
}


