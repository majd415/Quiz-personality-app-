import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../controler/ResultController.dart';
import '../../core/constant/imageasset.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResultControllerImp controller= Get.put(ResultControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(
        body:  ListView(
          children: [

            Container(

              child: Stack(
                  clipBehavior: Clip.none,

                  children: [
                    Container(
                        clipBehavior: Clip.antiAlias,
                        width:screenWidth > 600? 1600:  500,                        height: 274,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(0),
                          ),
                          color : Color.fromRGBO(65, 71, 129, 1),
                        )
                    ),

                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 50,),
                        child: Text('26'.tr, textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(242, 242, 242, 1),
                            fontFamily: 'Ciro',
                            fontSize: 16,
                            letterSpacing: -0.3333333432674408,
                            fontWeight: FontWeight.bold,
                            height: 1
                        ),),
                      ),
                    ),
                  SizedBox(height: 20,),
                     Center(
                       child: Container(
                              width: 296,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),


                              ),
                            child: Center(child: Lottie.asset(AppImageAsset.resultani,width: 250,height: 250)),

                          ),
                     )

                  ]
              ),
            ),
            SizedBox(height: 50,),
            // Figma Flutter Generator Rectangle16Widget - RECTANGLE



               GetBuilder<ResultControllerImp>(builder: (controller)=>

                HandlingDataView(statusRequest: controller.statusRequest,

                  widget:
    controller.finalResultPercentageList.length>0 ?
        Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ...List.generate(controller.finalResultPercentageList.length, (index) =>
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    ...List.generate(controller.finalResultList.length, (index) =>
                                        Container(
                                          margin:EdgeInsets.only(right: 10) ,
                                          child: CircularPercentIndicator(
                                            radius: 50.0,
                                            lineWidth: 10.0,
                                            percent: controller.finalResultPercentageList[index]/100,
                                            animation: true,
                                            animationDuration: 3000,
                                            center: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${controller.finalResultPercentageList[index].toInt()}",
                                                  style:
                                                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                                                      color: Colors.blue),
                                                ),
                                                new Icon(
                                                  Icons.percent_outlined,
                                                  size: 30.0,
                                                  color: Colors.blue,
                                                ),
                                              ],
                                            ),
                                            backgroundColor: Colors.blueGrey,
                                            progressColor: Color.fromRGBO(48, 199, 236, 1),
                                          ),
                                        ),

                                    )

                                  ],
                                ),




                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(controller.getfitures[0]["positive_fetures"]=="1")
                            InkWell(
                              onTap: (){
                                controller.openPositevPdf();
                              },
                              child: Container(
                                width: 216,
                                height: 175,
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  boxShadow : [BoxShadow(
                                      color: Color.fromRGBO(48, 199, 236, 1),
                                      offset: Offset(0,4),
                                      blurRadius: 50
                                  )],
                                  border : Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    width: 1,
                                  ),
                                  gradient : LinearGradient(
                                      begin: Alignment(-6.123234262925839e-17,-1),
                                      end: Alignment(1,-6.123234262925839e-17),
                                      colors: [Color.fromRGBO(22, 217, 227, 1),Color.fromRGBO(214, 227, 229, 1)]
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // controller.finalResultList[0]
                                    Text("${controller.finalResultList[0]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(

                                        color: Colors.black,
                                        fontFamily: 'Ciro',
                                        fontSize: 14,

                                        fontWeight: FontWeight.bold,
                                        height: 1.3,

                                      ),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('27'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Ciro',
                                        fontSize: 14,

                                        fontWeight: FontWeight.bold,
                                        height: 1.3,

                                      ),),


                                  ],
                                ),

                              ),
                            ),
                          SizedBox(
                            height: 20,
                          ),

                          if(controller.getfitures[0]["negative_fetures"]=="1")

                            InkWell(
                              onTap: (){
                                controller.openNegativePdf();
                              },
                              child: Container(
                                width: 216,
                                height: 175,
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  boxShadow : [BoxShadow(
                                      color: Color.fromRGBO(48, 199, 236, 1),
                                      offset: Offset(0,4),
                                      blurRadius: 50
                                  )],
                                  border : Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    width: 1,
                                  ),
                                  gradient : LinearGradient(
                                      begin: Alignment(-6.123234262925839e-17,-1),
                                      end: Alignment(1,-6.123234262925839e-17),
                                      colors: [Color.fromRGBO(22, 217, 227, 1),Color.fromRGBO(214, 227, 229, 1)]
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // controller.finalResultList[0]
                                    Text("",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Ciro',
                                        fontSize: 14,

                                        fontWeight: FontWeight.bold,
                                        height: 1.3,

                                      ),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('28'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Ciro',
                                        fontSize: 14,

                                        fontWeight: FontWeight.bold,
                                        height: 1.3,

                                      ),),


                                  ],
                                ),

                              ),
                            ),
                          SizedBox(
                            height: 20,
                          ),


                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ) : Text("no data") )
                 )



          ],
        )
    );
  }
}
