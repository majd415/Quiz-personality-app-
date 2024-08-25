import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SucessResetPasswordController extends GetxController{
  goToPageLogIn();
}
class SucessResetPasswordControllerImp extends SucessResetPasswordController{
  @override
  goToPageLogIn(){
    Get.offAllNamed(AppRoute.login);
  }

}