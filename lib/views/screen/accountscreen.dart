import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';
import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';

import '../../controler/profilecontroller.dart';
import '../../core/functions/validinput.dart';
import '../../core/localizition/changelocal.dart';
import '../widget/auth/customtextformauth.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller=Get.put(ProfileControllerImp());
    final screenWidth = Get.context!.width;
    LocalControler controllerlocal=Get.put(LocalControler());
    return Scaffold(
        body:  GetBuilder<ProfileControllerImp>(builder: (controller)=>
            Form(
              key: controller.formStateprofile,
              child: ListView(
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
                                    width: 180,
                                    height: 180,
                                    margin: EdgeInsets.only(top: 30),
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(150),
                                        topRight: Radius.circular(150),
                                        bottomLeft: Radius.circular(150),
                                        bottomRight: Radius.circular(150),
                                      ),
                                      boxShadow : [BoxShadow(
                                          color: Color.fromRGBO(48, 199, 236, 1),
                                          offset: Offset(0,0),
                                          blurRadius: 50
                                      )],
                                      image : DecorationImage(
                                          image: AssetImage('assets/images/s2.jpg'),
                                          fit: BoxFit.fitWidth
                                      ),
                                    )
                                                               ),
                               )


                        ]
                    ),
                  ),


                  SizedBox(
                    height: 70,
                  ),
                   if(controller.statusRequest==StatusRequest.loading)
                      LinearProgressIndicator(),


                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth > 600?500:350,

                        child: CustomTextFormAuth(
                          mycontroller: controller.username ,
                          iconData: Icons.person,
                          isNumber: false,
                          hinttext: " ${controller.mysServices.sharedPreferences.getString("username")}",
                          lable: '11'.tr,
                          valid: (val) {
                            val = val!.trim();

                            return validInput(val, 2, 100, "username");
                          },
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth > 600?500:350,

                        child: CustomTextFormAuth(
                          mycontroller: controller.phone,
                          isNumber: true,


                          hinttext: "${controller.mysServices.sharedPreferences.getString("phone")}  ",
                          lable:'12'.tr,
                          iconData: Icons.phone,
                          valid: (val){
                            return validInput(val!, 5, 100, "phone");

                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth > 600?500:350,

                        child: CustomTextFormAuth(
                          mycontroller: controller.password,
                          obscureText: false,
                          isNumber: false,
                          onTapIcon: () {

                          },
                          hinttext: "${controller.mysServices.sharedPreferences.getString("password")}",
                          lable: '13'.tr,
                          iconData: Icons.lock_outline,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                        ),
                      ),
                    ],
                  ),
                  ////lang

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: screenWidth > 600 ? 500 : 350,
                        child: DropdownButton<String>(
                          value: Get.locale?.languageCode, // القيمة الحالية
                          items: [
                            DropdownMenuItem(
                              value: 'en',
                              child: Text('English'),
                            ),
                            DropdownMenuItem(
                              value: 'ar',
                              child: Text('العربية'),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            if (newValue != null) {

                              controllerlocal.changeLang(newValue);
                              Get.offAllNamed('/');
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  ///////end lang
                  // Figma Flutter Generator Rectangle15Widget - RECTANGLE
                  // Figma Flutter Generator Rectangle16Widget - RECTANGLE
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(

                      children: [
                        InkWell(
                          onTap: (){
                            controller.updateUser();
                          },

                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(30),
                              ),
                              gradient : LinearGradient(
                                  begin: Alignment(1,0),
                                  end: Alignment(0,1),
                                  colors: [Color.fromRGBO(22, 217, 227, 1),Color.fromRGBO(214, 119, 30, 1)]
                              ),
                            ),
                            child: Text('15'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ciro',
                                fontSize: 25,

                                fontWeight: FontWeight.bold,
                                height: 1.3,

                              ),),
                          ),
                        ),
                        Spacer(),
                        // Figma Flutter Generator Rectangle14Widget - RECTANGLE
                        InkWell(
                          onTap: (){
                            Get.offAllNamed(AppRoute.login);
                            controller.mysServices.sharedPreferences.setString("step", "1");


                          },
                          child: Container(
                            alignment: Alignment.center,

                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(0),
                              ),
                              gradient : LinearGradient(
                                  begin: Alignment(1,0),
                                  end: Alignment(0,1),
                                  colors: [Color.fromRGBO(22, 217, 227, 1),Color.fromRGBO(232, 23, 73, 1)]
                              ),
                            ),
                            child: Text('14'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ciro',
                                fontSize: 25,

                                fontWeight: FontWeight.bold,
                                height: 1.3,

                              ),),

                          ),
                        )
                      ],
                    ),
                  )


                ],
              ),
            )


          )
    );
  }
}

