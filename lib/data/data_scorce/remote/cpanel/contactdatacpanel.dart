
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class ContactDataCpanel{
  Crud crud;
  ContactDataCpanel(this.crud);



  getContactCpanel()async{

    var response=await crud.postData(LinkApp.getcontactCpanel, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  updateContactDataCpanel(String whatsapp ,String email,String phone)async{

    var response=await crud.postData(LinkApp.editcontactCpanel, {
      "email"     :email,
      "whatsapp" :whatsapp ,
      "phone" : phone,



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

}