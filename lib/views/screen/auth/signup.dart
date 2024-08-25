import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';

import '../../../controler/auth/signup_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextformauth.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {

    // Get.lazyPut(()=>SignUpControllerImp());
    Get.put(SignUpControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(


      body: WillPopScope(
          onWillPop:kIsWeb==true? null: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(builder: (controller)=>
          controller.statusRequest ==   StatusRequest.loading ? Center(child: CircularProgressIndicator(),) :
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Form(
              key:controller.formStatesignup ,
              child: ListView(
                children: [

                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      '38'.tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Ciro',
                          fontSize: 20,
                          letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                    if(kIsWeb==true)
                         Container(
                      width: 200,
                      height: 300,
                      child: Image(
                        fit: screenWidth > 600?BoxFit.contain : BoxFit.fill,
                        image: AssetImage(
                          "assets/images/signup.PNG",
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                            width: screenWidth > 600?500:290,

                            child: CustomTextFormAuth(
                              mycontroller: controller.username,
                              iconData: Icons.person,
                              isNumber: false,
                              hinttext: '39'.tr,
                              lable: '40'.tr,
                              valid: (val) {
                                return validInput(val!, 5, 100, "username");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                            width: screenWidth > 600?500:290,

                            child: CustomTextFormAuth(
                              mycontroller: controller.email,

                              iconData: Icons.email_outlined,
                              isNumber: false,
                              hinttext: '41'.tr,
                              lable: '42'.tr,
                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                            width: screenWidth > 600?500:290,

                            child: CustomTextFormAuth(
                              mycontroller: controller.phone,

                              isNumber: true,

                              hinttext: '43'.tr,
                              lable: '44'.tr,
                              iconData: Icons.phone,
                              valid: (val){
                                return validInput(val!, 5, 100, "phone");

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GetBuilder<SignUpControllerImp>(
                      builder: (controller) =>
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Container(
                                    width: screenWidth > 600?500:290,

                                    child: CustomTextFormAuth(
                                                            obscureText: false,
                                                            isNumber: false,
                                                            onTapIcon: () {

                                                            },
                                                            mycontroller: controller.password,
                                                            hinttext: '45'.tr,
                                                            lable: '46'.tr,
                                                            iconData: Icons.lock_outline,
                                                            valid: (val) {
                                    return validInput(val!, 5, 30, "password");
                                                            },
                                                          ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    textDirection: Get.locale?.languageCode == 'ar'?TextDirection.ltr :TextDirection.rtl,
                    mainAxisAlignment: screenWidth > 600?MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){

                            controller.toSignIn();

                              },
                        child: Text(
                          '47'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontFamily: 'Ciro',
                              fontSize: 13,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      ),
                      Text(
                        '48'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Ciro',
                            fontSize: 13,
                            letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),




                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                         width: screenWidth > 600?500:290,
                            child: CustomButtomAuth(
                              onPressed: (){
                                controller.signup();
                              },
                              text: '49'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),)
      ),
    );
  }
}


