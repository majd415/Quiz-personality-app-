import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';

import '../../../controler/auth/login_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextformauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    LoginControllerImp controller = Get.put(LoginControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(


      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller)=>
        controller.statusRequest ==   StatusRequest.loading ? Center(child: CircularProgressIndicator(),) :
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),

              child: Form(
                key:controller.formState ,
                child: ListView(
                  children: [


                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        '29'.tr,
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
                    Container(
                        width: 200,
                        height: 300,
                        child: Image(
                          fit: screenWidth > 600?BoxFit.contain : BoxFit.fill,
                          image: AssetImage(
                            "assets/images/loginlogoimage.PNG",
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
                           Center(
                             child: Container(
                                width: screenWidth > 600?500:290,
                               child: CustomTextFormAuth(
                                 mycontroller: controller.email,
                                 iconData: Icons.email_outlined,
                                 isNumber: false,
                                 hinttext: '30'.tr,
                                 lable: '31'.tr,
                                 valid: (val) {
                                   return validInput(val!, 5, 100, "email");
                                 },
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                   GetBuilder<LoginControllerImp>(
                       builder: (controller) =>
                           Center(
                             child: SingleChildScrollView(
                               scrollDirection: Axis.horizontal,

                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,

                                 children: [
                                   Center(
                                     child: Container(
                                       width: screenWidth > 600?500:290,

                                       child: CustomTextFormAuth(

                                                                obscureText: controller.isShowPassword,
                                                                isNumber: false,
                                                                onTapIcon: () {
                                       controller.showPassword();
                                                                },
                                                                mycontroller: controller.password,
                                                                hinttext: '32'.tr,
                                                                lable: '33'.tr,
                                                                iconData: Icons.lock_outline,
                                                                valid: (val) {
                                       return validInput(val!, 5, 30, "password");
                                                                },
                                                              ),
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
                     textDirection:Get.locale?.languageCode == 'ar'?TextDirection.ltr :TextDirection.rtl ,
                     mainAxisAlignment:screenWidth > 600?MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
                     children: [
                       InkWell(
                         onTap: (){
                           controller.toSignUp();
                         },
                         child: Text(
                           '34'.tr,
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
                         '35'.tr,
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
                             width: screenWidth > 600?300:290,

                             child: CustomButtomAuth(
                               onPressed: (){
                                 controller.login();
                               },
                               text: '36'.tr,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   Center(child: InkWell(
                     onTap: (){
                       Get.offNamed(AppRoute.forgetPassword);
                     },
                     child: Text(
                       '37'.tr,
                       style: TextStyle(
                           color: Color.fromRGBO(22, 217, 227, 1),
                           fontFamily: 'Ciro',
                           fontSize: 13,
                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                           fontWeight: FontWeight.bold,
                           height: 1
                       ),
                     ),
                   ))
                  ],
                ),
              ),
            ),)
      ),
    );
  }
}


