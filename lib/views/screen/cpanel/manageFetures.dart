import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../../controler/cpanel/managefeturescontroller.dart';

class ManageFetures extends StatelessWidget {
  const ManageFetures({super.key});

  @override
  Widget build(BuildContext context) {
    FeturesCpanelControllerImp controller=Get.put(FeturesCpanelControllerImp());
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          SizedBox(height: 30,),
          Center(child: Text("Manage Fetures "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
          SizedBox(height: 30,),

          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [

                    Text(" Positive Result ",style:
                    TextStyle(
                        fontSize: 30,
                        color: Colors.black
                        ,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 50,),
                    GetBuilder<FeturesCpanelControllerImp>(builder: (controller)=>
                    HandlingDataView(
                        statusRequest: controller.statusRequest!,
                        widget:controller.data.length<=0?CircularProgressIndicator():
                        FlutterSwitch(
                          width: 125.0,
                          height: 55.0,
                          valueFontSize: 18.0,
                          toggleSize: 45.0,
                          value:int.parse(controller.data[0]["positive_fetures"])==1?true:false,//status,
                          borderRadius: 30.0,
                          padding: 8.0,
                          showOnOff: true,

                          onToggle: (val) {

                            if(int.parse(controller.data[0]["positive_fetures"])==1){
                              controller.updateShowfituriespositive("0");

                            }else{
                              controller.updateShowfituriespositive("1");

                            }
                            // status = val;

                          },
                        ),
                    )


                    )   ],
                ),


              ],
            ),

          ),
          SizedBox(height: 30,),

          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [

                    Text(" Negative Result ",style:
                    TextStyle(
                        fontSize: 30,
                        color: Colors.black
                        ,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 50,),
                   GetBuilder<FeturesCpanelControllerImp>(builder: (controller) => HandlingDataView(

                       statusRequest: controller.statusRequest!,
                       widget: controller.data.length<=0?CircularProgressIndicator(): FlutterSwitch(
                         width: 125.0,
                         height: 55.0,
                         valueFontSize: 18.0,
                         toggleSize: 45.0,
                         value: int.parse(controller.data[0]["negative_fetures"])==1?true:false,//status,
                         borderRadius: 30.0,
                         padding: 8.0,
                         showOnOff: true,
                         onToggle: (val) {
                           if(int.parse(controller.data[0]["negative_fetures"])==1){
                             controller.updateShowfituriesNegative("0");

                           }else{
                             controller.updateShowfituriesNegative("1");

                           }

                           // status = val;

                         },
                       ),),)
                  ],
                ),


              ],
            ),

          ),


        ],
      ),
    );
  }
}



