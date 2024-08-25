import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/localizition/changelocal.dart';
import 'package:zaid_mohamed_test/routes.dart';
import 'package:zaid_mohamed_test/views/screen/onboardingScreen.dart';

import 'controler/paymentscontroller.dart';
import 'core/class/crud.dart';
import 'core/localizition/translations.dart';
import 'core/services/services.dart';
import 'data/data_scorce/remote/payments.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Crud());
  Peymentsdata c=Peymentsdata(Crud());
  c.getAmountPayment();

await initialServices();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // فقط الوضع العمودي العلوي
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalControler controler = Get.put(LocalControler());
    return GetMaterialApp(
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      locale: controler.language,
      theme: controler.appTheme,
      // initialBinding: InitialBinding(),
      //  home: OnBoardingScreen(),
      // const Language(),
      // routes:routes,
       getPages: routes,

    );
  }
}

