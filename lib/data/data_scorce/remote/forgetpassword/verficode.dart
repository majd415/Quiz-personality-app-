
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class VerfiyCodeForgetPasswordData{
  Crud crud;
  VerfiyCodeForgetPasswordData(this.crud);


  postData(String email,String verifycode)async{

    var response=await crud.postData(LinkApp.verfiycodeForgetpassword, {
      "email"   : email ,

      "verifycode" : verifycode,


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }


}