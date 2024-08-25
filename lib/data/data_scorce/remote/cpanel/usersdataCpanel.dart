
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class UsersDtataCpanel{
  Crud crud;
  UsersDtataCpanel(this.crud);


  addNewUserCpanel(String username,String password,String email,String phone)async{

    var response=await crud.postData(LinkApp.addNewUserCpanel, {

      "user_name" :username ,
      "user_email"   : email ,
      "user_password" : password,

      "user_phone"   : phone ,


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  getallusersCpanel()async{

    var response=await crud.postData(LinkApp.getallusersCpanel, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  updateUserDataCpanel(String id,String username,String password,String email,String phone)async{

    var response=await crud.postData(LinkApp.updateUserDataCpanel, {
      "userid"     :id,
      "username" :username ,
      "userpassword" : password,
      "email"   : email ,
      "userphone"   : phone ,


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

  deleteUserDataCpanel(String id)async{

    var response=await crud.postData(LinkApp.deleteUserDataCpanel, {
      "user_id"     :id,



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

}