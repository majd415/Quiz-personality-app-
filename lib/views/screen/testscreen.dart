import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../controler/testcontroller.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestAppControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(

      body: ListView(
        children: [
          GetBuilder<TestAppControllerImp> (
            builder: (controller)
            =>HandlingDataView(

              statusRequest: controller.statusRequest,

              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration:  BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                        image: DecorationImage(image: AssetImage("assets/images/testimg.jpg",),

                            fit: screenWidth > 600?BoxFit.contain : BoxFit.fill)
                    ),

                  ),
                  // Figma Flutter Generator Rectangle13Widget - RECTANGLE

                ...List.generate(
                    controller.listquestiondata.length,
                        (index) =>Container(
                          alignment: Alignment.center,
                          width: 375,
                          height: 76,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            gradient : LinearGradient(
                                begin: Alignment(1,0),
                                end: Alignment(0,1),
                                colors: [Color.fromRGBO(22, 217, 227, 1),Color.fromRGBO(53, 159, 185, 1)]
                            ),
                          ),
                          child: Text("${Get.locale?.languageCode == 'ar'? controller.listquestiondata[index]['question_text_ar']:controller.listquestiondata[index]['question_text_en']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Ciro',
                              fontSize: 14,

                              fontWeight: FontWeight.bold,
                              height: 1.3,

                            ),
                            textAlign:TextAlign.center ,),

                        ),
                ),
                  SizedBox(height: 20,),
                  //list// Figma Flutter Generator Rectangle14Widget - RECTANGLE

                  ...List.generate(


                      controller.listdata.length, (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.only(
                      bottom: 5,
                      left:controller.selectedIndex == index  ? 30 : 10,
                      right: controller.firstTrans==0 ? controller.firstpos: controller.endpos
                    ),
                    alignment: Alignment.center,
// assuming height of each item is 50 + 5 margin
                      child: InkWell(
                        onTap: () {

                          controller.selectedIndex = index;

                          controller.selectAnswarefunc(index);


                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          alignment: Alignment.center,
                          width: 375,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment(1, 0),
                              end: Alignment(0, 1),
                              colors: controller.selectedIndex != index
                                  ? [Color.fromRGBO(22, 217, 227, 1), Color.fromRGBO(53, 159, 185, 1)]
                                  : [Color.fromRGBO(0, 255, 40, .4), Color.fromRGBO(0, 200, 40, .4)],
                            ),
                          ),
                          child: Text(
                        Get.locale?.languageCode == 'ar'? controller.listdata[index]["answer_text"]: controller.listdata[index]["answare_text_en"],
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Ciro',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    ),



                  InkWell(
                    onTap: (){
                      if(controller.ind==0 || controller.ind==1 ||controller.ind==2 ||controller.ind==3){

                        controller.nextAnsware();
                        controller.getGroupAnsware(controller.groupAnswar);
                        controller.transfarePos();
                        controller.addperResult(controller.ind);
                        controller.count++;
                      }else{

                        Get.defaultDialog(

                            title: '17'.tr,
                            middleText: '18'.tr,
                            actions: [


                              ElevatedButton(
                                  onPressed: (){
                                    Get.back();
                                  },
                                  child:  Text('19'.tr)),
                            ]
                        );
                      }

                    },
                    child: Container(
                      alignment: Alignment.center,

                      width: 166,
                      height: 37,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        gradient : LinearGradient(
                            begin: Alignment(1,0),
                            end: Alignment(0,1),
                            colors: [Color.fromRGBO(22, 217, 227, 1),Color.fromRGBO(53, 159, 185, 1)]
                        ),
                      ),
                      child: Text('20'.tr,
                        style:  TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ciro',
                          fontSize: 12,

                          fontWeight: FontWeight.bold,
                          height: 1.3,

                        ),
                        textAlign: TextAlign.center,),
                    ),
                  )
                ],
              )),)
        ],
      )  // Figma Flutter Generator Httpsapplottiefilescomanimation1344a9304da24e67989656a7b54092b0Widget - FRAME

    );
  }
}
