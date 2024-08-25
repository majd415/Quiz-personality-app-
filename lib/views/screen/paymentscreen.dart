
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../controler/paymentscontroller.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/validinput.dart';
import '../paypalweb.dart';
import '../widget/auth/custombuttomauth.dart';
import '../widget/auth/customtextformauth.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.context!.width;
    PaymentsControllerImp controller=Get.put(PaymentsControllerImp());
    return   Scaffold(
      body:  ListView(
        children: [

          Container(

            child: Column(

                children: [

                  SizedBox(height: 50,),

                  Center(

                      child: Text('21'.tr, textAlign: TextAlign.center, style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ciro',
                          fontSize: 18,
                          letterSpacing: -0.3333333432674408,
                          fontWeight: FontWeight.bold,
                          height: 1
                      ),)
                  ),
                  SizedBox(height: 30,),
                  Center(

                      child: Container(
                          width: 296,
                          height: 172,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            boxShadow : [BoxShadow(
                                color: Color.fromRGBO(48, 199, 236, 1),
                                offset: Offset(0,0),
                                blurRadius: 50
                            )],
                            image : DecorationImage(
                                image: AssetImage('assets/images/payscreen.png'),
                                fit: BoxFit.fitWidth
                            ),
                          )
                      )
                  ),

                ]
            ),
          ),
          SizedBox(height: 70,),
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(

               child: Text('22'.tr, textAlign: TextAlign.center, style: TextStyle(
                   color: Colors.black,
                   fontFamily: 'Ciro',
                   fontSize: 14,
                   letterSpacing: -0.3333333432674408,
                   fontWeight: FontWeight.bold,
                   height: 1
               ),)
           ),
           SizedBox(height: 30,),

           Form(
             key: controller.formStatepayments,
             child: Column(
               children: [
                 Container(
                   width: screenWidth > 600?500:350,

                   child: CustomTextFormAuth(
                     mycontroller: controller.codediscount,
                     iconData: Icons.discount_outlined,
                     isNumber: false,
                     hinttext: "Add Copon",
                     lable: "Copon",
                     valid: (val) {
                       return validInput(val!, 1, 100, "username");
                     },
                   ),
                 ),
                 SizedBox(height: 30,),

                 Container(
                   width: screenWidth > 600?500:350,
                   child: CustomButtomAuth(
                     onPressed: (){
                       controller.getCoponDiscount();
                     },
                     text: '23'.tr,
                   ),
                 ),
               ],
             ),
           ),
           SizedBox(height: 30,),


               Column(
                      children: [
                        Center(

                            child: Text('24'.tr, textAlign: TextAlign.center, style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Ciro',
                                fontSize: 14,
                                letterSpacing: -0.3333333432674408,
                                fontWeight: FontWeight.bold,
                                height: 1
                            ),)
                        ),
                        SizedBox(height: 30,),
                        GetBuilder<PaymentsControllerImp>(builder: (controller)=>
                          HandlingDataView(

                              statusRequest: controller.statusRequest,

                              widget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(

                                      child: Text(' ${controller.endAmount}  USD ', textAlign: TextAlign.center, style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Ciro',
                                          fontSize: 14,
                                          letterSpacing: -0.3333333432674408,
                                          fontWeight: FontWeight.bold,
                                          height: 1
                                      ),),



                                  ),
                                  SizedBox(height: 30,),
                                  if(controller.endAmount.toDouble()!=0.0 )
                                       Center(
                                    child: TextButton(
                                      onPressed: () async {
                                        controller.paypaypal();
                                        // Get.toNamed(AppRoute.paypalWebview);
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.teal,
                                        foregroundColor: Colors.white,
                                        shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(1),
                                          ),
                                        ),
                                      ),
                                      child:  Text('25'.tr),
                                    ),
                                  ),
                                  if(controller.endAmount.toDouble()==0.0 )
                                     Center(
                                      child: TextButton(
                                        onPressed: () async {
                                          controller.goptoresult();
                                          // Get.toNamed(AppRoute.paypalWebview);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                          foregroundColor: Colors.white,
                                          shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(1),
                                            ),
                                          ),
                                        ),
                                        child:  Text('67'.tr),
                                      ),
                                    ),

                                ],
                              )
                          )
                          ,)
                      ],
                    ),



           SizedBox(height: 30,),

         ],
       ),


        ],
      )
    );
  }
}
