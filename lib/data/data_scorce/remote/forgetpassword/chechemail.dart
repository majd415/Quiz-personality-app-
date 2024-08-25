
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class CheckEmailForgetPasswordData{
  Crud crud;
  CheckEmailForgetPasswordData(this.crud);


  postData(String email)async{

    var response=await crud.postData(LinkApp.checkEmail, {
      "email"   : email ,

    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }


}