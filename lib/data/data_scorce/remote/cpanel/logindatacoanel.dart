
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class LoginDataCpanel{
  Crud crud;
  LoginDataCpanel(this.crud);


  logindatacpanel(String email,String password)async{

    var response=await crud.postData(LinkApp.loginCpanel, {

      "email" :email ,
      "password"   : password ,



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }





}