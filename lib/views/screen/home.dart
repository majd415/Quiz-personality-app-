import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';
import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';

import '../../controler/homecontroller.dart';
import '../widget/sliderhome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(HomeControllerImp());
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
      body:

      GetBuilder<HomeControllerImp>(builder: (controller)=>HandlingDataView(

          statusRequest: controller.statusRequest,

          widget: ListView(

            children: [
              SliderHome(),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: Get.locale?.languageCode == 'ar'
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.start,

                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: Get.locale?.languageCode  == 'ar' ? 20 : 0,
                      left: Get.locale?.languageCode  == 'ar' ? 0 : 20,
                    ),
                    child: Text(
                      '6'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Ciro',
                        fontSize: 25,
                        letterSpacing: -0.3333333432674408,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Figma Flutter Generator Ellipse5Widget - ELLIPSE
                  InkWell(
                    onTap: (){
                      // in controller for add argument from home
                      Get.toNamed(AppRoute.payScreen);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(33, 205, 228, 1),
                            offset: Offset(1,0),
                            blurRadius: 4
                        )],
                        gradient : LinearGradient(
                            begin: Alignment(6.123234262925839e-17,1),
                            end: Alignment(-1,6.123234262925839e-17),
                            colors: [Color.fromRGBO(22, 217, 227, 1),
                              Color.fromRGBO(53, 159, 185, 1)]
                        ),
                        borderRadius : BorderRadius.all(Radius.elliptical(100, 100)),
                      ),
                      child: Text('7'.tr
                        ,style: TextStyle(

                            color: Colors.white,
                            fontFamily: 'Ciro',
                            fontSize: 25,
                            letterSpacing: -0.3333333432674408,
                            fontWeight: FontWeight.bold,
                            height: 1

                        ),
                        textAlign: TextAlign.center,

                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: Get.locale?.languageCode == 'ar'
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.start,

                children: [
                  Container(
                    margin: EdgeInsets.only(
              right: Get.locale?.languageCode  == 'ar' ? 20 : 0,
                left: Get.locale?.languageCode  == 'ar' ? 0 : 20,
              ),
                    child: Text('8'.tr, textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Ciro',
                        fontSize: 25,
                        letterSpacing: -0.3333333432674408,
                        fontWeight: FontWeight.bold,
                        height: 1
                    ),),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Center(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Figma Flutter Generator Rectangle16Widget - RECTANGLE

                          if(controller.results.isNotEmpty)
                               ...List.generate(controller.results.length, (index) =>
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      controller.gotoprofileresult(index);
                                    },
                                    child: Container(
                                      width: 113,
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
                                          // ${controller.results[index]["results_percentage"]} %
                                          Text("70".tr,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Ciro",
                                                fontSize: 15
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
                                  ),
                                ),),
                          if(controller.results.isEmpty)
                               Container(
                              width: 400,
                              margin: EdgeInsets.only(bottom: 30),
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
                               SizedBox(height: 60,)





                        ]
                    )





                ),
              ),







            ],
          ))

      ///////

    ));
  }
}
