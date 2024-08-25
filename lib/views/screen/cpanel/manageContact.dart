import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../../controler/cpanel/contactcpanelcontroller.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextformauth.dart';

class ManageContact extends StatelessWidget {
  const ManageContact({super.key});

  @override
  Widget build(BuildContext context) {
    ContactCpanelControllerImp controller=Get.put(ContactCpanelControllerImp());
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          SizedBox(height: 30,),
          Center(child: Text("Manage Contact  "
            ,style: TextStyle(
                fontSize: 50,
                color: Colors.black45
                ,fontWeight: FontWeight.bold
            ),)),
          Center(child: Text("Current Contact  "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
     GetBuilder<ContactCpanelControllerImp>(builder: (controller)=>
     controller.data.length<=0? Center(
       child: CircularProgressIndicator(),
     ):
     HandlingDataView(
         statusRequest:controller.statusRequest! ,

         widget:Column(
           children: [
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 gradient: LinearGradient(
                     begin: Alignment(6.123234262925839e-17, 1),
                     end: Alignment(-1, 6.123234262925839e-17),
                     colors: [
                       Color.fromRGBO(22, 217, 227, 1),
                       Color.fromRGBO(35, 208, 231, 1),
                       Color.fromRGBO(48, 199, 236, 1)
                     ]),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                   Row(
                     children: [
                       Icon(Icons.email,size: 40),
                       SizedBox(width: 50,),
                       Text("${controller.data[0]['email']}",style:
                       TextStyle(
                           fontSize: 18,
                           color: Colors.black
                           ,fontWeight: FontWeight.bold
                       ),)
                     ],
                   ),


                 ],
               ),

             ),
             SizedBox(height: 30,),

             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 gradient: LinearGradient(
                     begin: Alignment(6.123234262925839e-17, 1),
                     end: Alignment(-1, 6.123234262925839e-17),
                     colors: [
                       Color.fromRGBO(22, 217, 227, 1),
                       Color.fromRGBO(35, 208, 231, 1),
                       Color.fromRGBO(48, 199, 236, 1)
                     ]),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                   Row(
                     children: [
                       Icon(Icons.phone,size: 40),
                       SizedBox(width: 50,),
                       Text( "${controller.data[0]['phone']}",style:
                       TextStyle(
                           fontSize: 18,
                           color: Colors.black
                           ,fontWeight: FontWeight.bold
                       ),)
                     ],
                   ),


                 ],
               ),

             ),
             SizedBox(height: 30,),

             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 gradient: LinearGradient(
                     begin: Alignment(6.123234262925839e-17, 1),
                     end: Alignment(-1, 6.123234262925839e-17),
                     colors: [
                       Color.fromRGBO(22, 217, 227, 1),
                       Color.fromRGBO(35, 208, 231, 1),
                       Color.fromRGBO(48, 199, 236, 1)
                     ]),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                   Row(
                     children: [
                       Icon(Icons.textsms_outlined,size: 40),
                       SizedBox(width: 50,),
                       Text("whatsapp:  ${controller.data[0]['whatsapp']}",style:
                       TextStyle(
                           fontSize: 18,
                           color: Colors.black
                           ,fontWeight: FontWeight.bold
                       ),)
                     ],
                   ),


                 ],
               ),

             ),
           ],
         ) )

     ),




          Center(child: Text("Update Contact  "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),

         Form(
           key:controller.formStatesUpadeteContactCpanel ,
           child:
         Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Column(
                   children: [
                     Container(
                       width: 300,
                       height: 70,
                       child: CustomTextFormAuth(
                          mycontroller: controller.email,
                         iconData: Icons.email,
                         isNumber: false,
                         hinttext: "add contact email  ",
                         lable: " Email ",
                         valid: (val) {
                           return validInput(val!, 5, 100, "Email");
                         },
                       ),
                     ),
                     Container(
                       width: 300,
                       height: 70,
                       child: CustomTextFormAuth(
                          mycontroller: controller.phone,
                         iconData: Icons.phone_android,
                         isNumber: false,
                         hinttext: "add WhatsApp Number  ",
                         lable: " WhatsApp Number ",
                         valid: (val) {
                           return validInput(val!, 5, 100, "Phone");
                         },
                       ),
                     ),

                   ],
                 ),
                 Column(
                   children: [
                     Container(
                       width: 300,
                       height: 70,
                       child: CustomTextFormAuth(
                          mycontroller: controller.whatsapp,
                         iconData: Icons.phone_android,
                         isNumber: false,
                         hinttext: "add WhatsApp Number  ",
                         lable: " WhatsApp Number ",
                         valid: (val) {
                           return validInput(val!, 5, 100, "Phone");
                         },
                       ),
                     ),
                   ],
                 ),


               ],
             ),
             SizedBox(height: 20,),
             Center(
               child: CustomButtomAuth(
                 onPressed: (){
                   controller.updateContact();
                 },
                 text: " Update Contact Information ",
               ),
             )
           ],
         ),
         )



        ],
      ),
    );
  }
}


