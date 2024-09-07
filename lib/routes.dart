
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zaid_mohamed_test/views/paypalweb.dart';
import 'package:zaid_mohamed_test/views/screen/accountscreen.dart';
import 'package:zaid_mohamed_test/views/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:zaid_mohamed_test/views/screen/auth/forgetpassword/resetpassword.dart';
import 'package:zaid_mohamed_test/views/screen/auth/forgetpassword/sucessresetpassword.dart';
import 'package:zaid_mohamed_test/views/screen/auth/forgetpassword/verifycodeforgetpassword.dart';
import 'package:zaid_mohamed_test/views/screen/auth/login.dart';
import 'package:zaid_mohamed_test/views/screen/auth/signup.dart';
import 'package:zaid_mohamed_test/views/screen/auth/verydiycodesignup.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/cpanelscreen.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/firstpage.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/logincpanel.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/manageContact.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/manageFetures.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/manage_users.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/manageanswarequestion.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/managepayments.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/manageresultfile.dart';
import 'package:zaid_mohamed_test/views/screen/cpanel/openonlap.dart';
import 'package:zaid_mohamed_test/views/screen/home.dart';
import 'package:zaid_mohamed_test/views/screen/homescreen.dart';
import 'package:zaid_mohamed_test/views/screen/language.dart';
import 'package:zaid_mohamed_test/views/screen/onboardingScreen.dart';
import 'package:zaid_mohamed_test/views/screen/paymentscreen.dart';
import 'package:zaid_mohamed_test/views/screen/result.dart';
import 'package:zaid_mohamed_test/views/screen/testscreen.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
// kIsWeb == true ? Login() : OnBoardingScreen() ;
final screenWidth = Get.context!.width;

List<GetPage<dynamic>>? routes=[

  // screenWidth >600 ?LoginCpanel():  OpenOnLap()
  //kIsWeb == true ? Login() : OnBoardingScreen()
  GetPage(name: "/", page:  () {

    return Language();//creenWidth >600 ?LoginCpanel():  OpenOnLap();//Language() ;
  },middlewares: [
    MyMiddleware(),
  ] ),

  //onboarding PayScreen()
  GetPage(name: AppRoute.login, page: ()=>const Login() ),
  GetPage(name: AppRoute.signup, page: ()=>const Signup() ),
  GetPage(name: AppRoute.forgetPassword, page: ()=>const ForgetPassword() ),
  GetPage(name: AppRoute.verefiyCode, page: ()=> const VerifyCode() ),
  GetPage(name: AppRoute.resetPassword , page: ()=>const ResetPassword() ),
  GetPage(name: AppRoute.successResetPasword , page: ()=>const SuccessResetPassword()),
   GetPage(name: AppRoute.home , page: ()=>const HomeScreen()),
  GetPage(name: AppRoute.onboarding , page: ()=>const OnBoardingScreen()),

  GetPage(name: AppRoute.testScreen , page: ()=>const TestScreen()),
 // PayScreen
   GetPage(name: AppRoute.payScreen , page: ()=>const PayScreen()),

  GetPage(name: AppRoute.accountScreen , page: ()=>const AccountScreen()),

  GetPage(name: AppRoute.verifycodesignup, page: ()=> const VerifyCodeSignUp() ),
//result
  GetPage(name: AppRoute.result, page: ()=> const ResultScreen() ),
//cpanel

  GetPage(name: AppRoute.cpanelScreen, page: ()=> const CPanelScreen() ),
  GetPage(name: AppRoute.firstPageCpanel, page: ()=> const FirstPageCpanel() ),
  GetPage(name: AppRoute.manageUsers, page: ()=> const ManageUsers() ),

  GetPage(name: AppRoute.manageContact, page: ()=> const ManageContact() ),

  GetPage(name: AppRoute.manageFetures, page: ()=> const ManageFetures() ),

  GetPage(name: AppRoute.managepayments, page: ()=> const Managepayments() ),

  GetPage(name: AppRoute.manageresultfile, page: ()=> const Manageresultfile() ),
//paypalWebview
  GetPage(name: AppRoute.paypalWebview, page: ()=> PaypalWebview() ),

  GetPage(name: AppRoute.manageAnswareAndQuestion, page: ()=> ManageAnswareAndQuestion() ),
  // homeScreen
  GetPage(name: AppRoute.homeScreen, page: ()=> HomeScreen() ),

];