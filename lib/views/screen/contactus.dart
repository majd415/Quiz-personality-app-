import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../controler/contactcontroller.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {

    ContactControllerImp controller=Get.put(ContactControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(
        body:  GetBuilder<ContactControllerImp>(builder: (controller)=>

            ListView(
              children: [

                Container(

                  child: Stack(
                      clipBehavior: Clip.none,

                      children: [
                        Container(
                            clipBehavior: Clip.antiAlias,
                            width:screenWidth > 600? 1600:  500,
                            height: 274,
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
                         padding: EdgeInsets.only(top: 100,),
                         child:  Text('10'.tr, textAlign: TextAlign.center, style: TextStyle(
                             color: Color.fromRGBO(242, 242, 242, 1),
                             fontFamily: 'Ciro',
                             fontSize: 16,
                             letterSpacing: -0.3333333432674408,
                             fontWeight: FontWeight.bold,
                             height: 1
                         ),),
                       ),
                     )

                      ]
                  ),
                ),
                SizedBox(height: 20,),
                // Figma Flutter Generator Rectangle16Widget - RECTANGLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){

                        // controller.launchURL('${controller.contactdata[0]["phone"]}');
                          launch('tel: ${controller.contactdata[0]["phone"]}');
                      },
                      child: Container(
                        width: 232,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),

                          border : Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            width: 1,
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(

                            children: [
                              Icon(Icons.phone,size: 60,
                                color: Color.fromRGBO(48, 199, 236, 1),),
                              Spacer(),
                              Text("Phone ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Ciro',
                                  fontSize: 25,

                                  fontWeight: FontWeight.bold,
                                  height: 1.3,

                                ),),


                            ],
                          ),
                        ),

                      ),
                    )

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){

                        // controller.sendEmail('${controller.contactdata[0]["email"]}', '', '');
                        launch('mailto: ${controller.contactdata[0]["email"]}?subjects=this is subjects');

                      },
                      child: Container(
                        width: 232,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),

                          border : Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            width: 1,
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(

                            children: [
                              Icon(Icons.email,size: 60,
                                color: Color.fromRGBO(48, 199, 236, 1),),
                              Spacer(),
                              Text("Eamil ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Ciro',
                                  fontSize: 25,

                                  fontWeight: FontWeight.bold,
                                  height: 1.3,

                                ),),


                            ],
                          ),
                        ),

                      ),
                    )

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){


                        launch('https://wa.me/${controller.contactdata[0]["whatsapp"]}?text=hello');
                      },
                      child: Container(
                        width: 232,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),

                          border : Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            width: 1,
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(

                            children: [
                              Image(image:AssetImage("assets/images/whatsapp.PNG"),width:60 ,height: 60, ),
                              Spacer(),
                              Text("Whatsapp ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Ciro',
                                  fontSize: 25,

                                  fontWeight: FontWeight.bold,
                                  height: 1.3,

                                ),),


                            ],
                          ),
                        ),

                      ),
                    )

                  ],
                ),


              ],
            ),
          )
    );;
  }
}
