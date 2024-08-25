
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class LoginData{
  Crud crud;
  LoginData(this.crud);


  postData(String email,String password)async{

    var response=await crud.postData(LinkApp.login, {
      "email"   : email ,

      "password" : password,


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }


}