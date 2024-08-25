
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class UpdateUserData{
  Crud crud;
  UpdateUserData(this.crud);


  postData(String id,String username,String password,String email,String phone)async{

    var response=await crud.postData(LinkApp.updateProfile, {
             "userid"     :id,
      "username" :username ,
      "userpassword" : password,
      "email"   : email ,
      "userphone"   : phone ,


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }


}