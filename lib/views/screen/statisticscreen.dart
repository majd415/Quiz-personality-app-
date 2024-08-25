import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../controler/homecontroller.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller=Get.put(HomeControllerImp());

    return Scaffold(
      appBar: AppBar(
        leading:  Image(image: AssetImage("assets/images/logoapp.png",),
          width: 40,
          height: 40,),
        actions: [
          Icon(Icons.add_alert,size: 30,
            color: Colors.amber,
          ),
          Icon(Icons.whatshot_outlined,size: 30,
            color: Colors.green,),
          Icon(Icons.account_box_outlined,size: 30,
            color: Colors.lightBlue,),






        ],

      ),
      body:   GetBuilder<HomeControllerImp>(builder: (controller)=>
          controller.results.isNotEmpty?

            HandlingDataView(

            statusRequest: controller.statusRequest,

            widget: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Figma Flutter Generator Rectangle16Widget - RECTANGLE

                  if(controller.results.isNotEmpty)
                      ...List.generate(controller.results.length, (index) =>

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 104,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            gradient : LinearGradient(
                                begin: Alignment(40.123234262925839e-17,-1),
                                end: Alignment(1,-6.123234262925839e-17),
                                colors: [Color.fromRGBO(22, 217, 227, 1),Color.fromRGBO(214, 227, 229, 1)]
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${controller.results[index]["results_percentage"]} %",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ciro",
                                    fontSize: 20
                                ),),
                              Text("${controller.results[index]["personality_type"]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ciro",
                                    fontSize: 15
                                ),),
                            ],
                          ),
                        ),
                      ),),

                  if(controller.results.isEmpty)
                    Text('9'.tr
                      ,style:TextStyle(

                          color: Colors.black,
                          fontFamily: 'Ciro',
                          fontSize: 10,
                          letterSpacing: -0.3333333432674408,
                          fontWeight: FontWeight.bold,
                          height: 1

                      ),
                    )

                ],
              ),
            )): Center(
              child: Container(
              width: 400,
              child: Center(
                child: Text('9'.tr
                  ,style:TextStyle(

                      color: Colors.black,
                      fontFamily: 'Ciro',
                      fontSize: 14,
                      letterSpacing: -0.3333333432674408,
                      fontWeight: FontWeight.bold,
                      height: 1

                  ),
                ),
              ),
                        ),
            )
          ,)
      ,
    );
  }
}
