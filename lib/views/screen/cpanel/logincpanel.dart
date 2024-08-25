import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';

import '../../../controler/auth/login_controller.dart';
import '../../../controler/cpanel/logincpanelcontroller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextformauth.dart';

class LoginCpanel extends StatelessWidget {
  const LoginCpanel({super.key});

  @override
  Widget build(BuildContext context) {

    LoginCpanelControllerImp controller = Get.put(LoginCpanelControllerImp());
    final screenWidth = Get.context!.width;

    return Scaffold(


      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginCpanelControllerImp>(builder: (controller)=>
          controller.statusRequest ==   StatusRequest.loading ? Center(child: CircularProgressIndicator(),) :
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),

            child: Form(
              key:controller.formStatecpanel ,
              child: ListView(
                children: [

                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      ' Login To Cpanel ',
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
                          "assets/images/cpanel1.jpg",
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth > 600?500:350,
                        child: CustomTextFormAuth(
                          mycontroller: controller.email,
                          iconData: Icons.email_outlined,
                          isNumber: false,
                          hinttext: " admin email   ",
                          lable: "email ",
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                        ),
                      ),
                    ],
                  ),
                  GetBuilder<LoginCpanelControllerImp>(
                      builder: (controller) =>
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth > 600?500:350,

                                child: CustomTextFormAuth(

                                  obscureText: controller.isShowPassword,
                                  isNumber: false,
                                  onTapIcon: () {
                                    controller.showPassword();
                                  },
                                  mycontroller: controller.password,
                                  hinttext: " admin password ",
                                  lable: "password ",
                                  iconData: Icons.lock_outline,
                                  valid: (val) {
                                    return validInput(val!, 5, 30, "password");
                                  },
                                ),
                              ),
                            ],
                          )),


                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth > 600?300:350,

                        child: CustomButtomAuth(
                          onPressed: (){
                            controller.login();
                          },
                          text: " LogIn ",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
          ),)
      ),
    );
  }
}


