import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../../controler/cpanel/manageuserscpanelcontroller.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextformauth.dart';

class ManageUsers extends StatelessWidget {
  const ManageUsers({super.key});

  @override
  Widget build(BuildContext context) {

    ManageUsersCpanelControllerImp controller=Get.put(ManageUsersCpanelControllerImp());

    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          SizedBox(height: 30,),
          Center(child: Text("Manage Users  "
            ,style: TextStyle(
                fontSize: 50,
                color: Colors.black54
                ,fontWeight: FontWeight.bold
            ),)),
          Center(child: Text(" Add New User Account  "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
          SizedBox(height: 30,),
GetBuilder<ManageUsersCpanelControllerImp>(builder: (controller)=>
HandlingDataView(

    statusRequest: controller.statusRequest!,

    widget:           Form(
      key: controller.formStateAddNewUserCpanel,
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
                      mycontroller: controller.usernameAdd,
                      iconData: Icons.person,
                      isNumber: false,
                      hinttext: "add name for new user   ",
                      lable: " Name ",
                      valid: (val) {
                        return validInput(val!, 5, 100, "username");
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 70,
                    child: CustomTextFormAuth(
                      mycontroller: controller.emailAdd,

                      iconData: Icons.email_outlined,
                      isNumber: false,
                      hinttext: "add email for new user ",
                      lable: "Email ",
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
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
                      mycontroller: controller.phoneAdd,

                      isNumber: true,

                      hinttext: " add user phone",
                      lable: "Phone Number ",
                      iconData: Icons.phone,
                      valid: (val){
                        return validInput(val!, 5, 100, "phone");

                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 70,
                    child: CustomTextFormAuth(
                      obscureText: false,
                      isNumber: false,
                      onTapIcon: () {

                      },
                      mycontroller: controller.passwordAdd,
                      hinttext: "  add  password for new user ",
                      lable: " Password",
                      iconData: Icons.lock_outline,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
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
                controller.signup();
              },
              text: " Add user ",
            ),
          )
        ],
      ),
    ),
)

),
          SizedBox(height: 30,),


          Center(child: Text(" Edit user  Account  "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
          Center(child: Text("NOTE: you have to add id for user after that add all new updates for user   "
            ,style: TextStyle(
                fontSize: 15,
                color: Colors.redAccent
                ,fontWeight: FontWeight.bold
            ),)),
          SizedBox(height: 30,),
          GetBuilder<ManageUsersCpanelControllerImp>(builder:
              (controller)=>
                  HandlingDataView(
                      statusRequest: controller.statusRequest!,
                      widget: Form(
                        key: controller.formStatesUpadeteUserCpanel,


                        child:   Column(
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
                                        mycontroller: controller.idUserUpdate,
                                        iconData: Icons.perm_identity,
                                        isNumber: false,
                                        hinttext: "add id  user for edit  ",
                                        lable: " Id ",
                                        valid: (val) {
                                          return validInput(val!, 1, 100, "Number");
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 70,
                                      child: CustomTextFormAuth(
                                        mycontroller: controller.usernameUpdate,
                                        iconData: Icons.person,
                                        isNumber: false,
                                        hinttext: "add name  for edit   ",
                                        lable: " Name ",
                                        valid: (val) {
                                          return validInput(val!, 5, 100, "username");
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 70,
                                      child: CustomTextFormAuth(
                                        mycontroller: controller.emailUpdate,

                                        iconData: Icons.email_outlined,
                                        isNumber: false,
                                        hinttext: "add email  for edit",
                                        lable: "Email ",
                                        valid: (val) {
                                          return validInput(val!, 5, 100, "email");
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
                                        mycontroller: controller.phoneUpdate,

                                        isNumber: true,

                                        hinttext: " add user phone",
                                        lable: "Phone Number ",
                                        iconData: Icons.phone,
                                        valid: (val){
                                          return validInput(val!, 5, 100, "phone");

                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 70,
                                      child: CustomTextFormAuth(
                                        obscureText: false,
                                        isNumber: false,
                                        onTapIcon: () {

                                        },
                                        mycontroller: controller.passwordUpdate,
                                        hinttext: "  add  password for edit ",
                                        lable: " Password",
                                        iconData: Icons.lock_outline,
                                        valid: (val) {
                                          return validInput(val!, 5, 30, "password");
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
                                  controller.updateUser();
                                },
                                text: " Update user Information ",
                              ),
                            )
                          ],
                        ), ),)
          ),











          SizedBox(height: 30,),
          Center(child: Text(" Users Register In Application  "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
child: GetBuilder<ManageUsersCpanelControllerImp>(builder: (controller)=>
HandlingDataView(

    statusRequest: controller.statusRequest!, widget:

DataTable(

  columns: [
    DataColumn(label: Text('ID',style: TextStyle(fontWeight: FontWeight.bold),)),
    DataColumn(label: Text('Name',style: TextStyle(fontWeight: FontWeight.bold),)),
    DataColumn(label: Text('Email',style: TextStyle(fontWeight: FontWeight.bold),)),
    DataColumn(label: Text('Phone',style: TextStyle(fontWeight: FontWeight.bold),)),
    DataColumn(label: Text('Verify Code',style: TextStyle(fontWeight: FontWeight.bold),)),
    DataColumn(label: Text('Approved',style: TextStyle(fontWeight: FontWeight.bold),)),
    DataColumn(label: Text('Created At',style: TextStyle(fontWeight: FontWeight.bold),)),
    DataColumn(label: Text('Actions',style: TextStyle(fontWeight: FontWeight.bold),)),
  ],

  rows:controller.data.map((user) {
    return DataRow(cells: [
      DataCell(Text(user['user_id'].toString(),style: TextStyle(color: Colors.black),)),
      DataCell(Text(user['user_name'],style: TextStyle(color: Colors.black))),
      DataCell(Text(user['user_email'],style: TextStyle(color: Colors.black))),
      DataCell(Text(user['user_phone'],style: TextStyle(color: Colors.black))),
      DataCell(Text(user['user_verifycode'],style: TextStyle(color: Colors.black))),
      DataCell(Text(user['users_approve']==1 ? 'Yes' : 'No',style: TextStyle(color: Colors.black))),
      DataCell(Text(user['created_at'],style: TextStyle(color: Colors.black))),
      DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                controller.deleteUsersdatacpanel(user['user_id']);
                // إضافة منطق حذف المستخدم هنا
              },
            ),
          ],
        ),
      ),
    ]);
  }).toList(),
),))
                  )

              ],
            ),
          )
        ],
      ),
    );
  }
}


