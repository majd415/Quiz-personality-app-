
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class VerifyCodeSignUpData{
  Crud crud;
  VerifyCodeSignUpData(this.crud);


  postData(String email,String verifycode)async{

    var response=await crud.postData(LinkApp.verifycodesignup, {

      "email"   : email ,
      "verifycode"   : verifycode ,



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  resendData(String email)async{

    var response=await crud.postData(LinkApp.resend, {

      "email"   : email ,

    });
    return response.fold((l) => l, (r) =>r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }


}