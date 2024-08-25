
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class SignupData{
  Crud crud;
  SignupData(this.crud);


  postData(String username,String password,String email,String phone)async{

    var response=await crud.postData(LinkApp.signup, {

      "username" :username ,
      "password" : password,
      "email"   : email ,
      "phone"   : phone ,


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }


}