import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SucessSignUpController extends GetxController{
  goToPageLogIn();
}
class SucessSignUpControllerImp extends SucessSignUpController {
  @override
  goToPageLogIn(){
    Get.offAllNamed(AppRoute.login);
  }

}