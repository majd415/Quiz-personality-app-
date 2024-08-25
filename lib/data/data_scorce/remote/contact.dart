


import '../../../apilink.dart';
import '../../../core/class/crud.dart';

class ContactData{
  Crud crud;
  ContactData(this.crud);



  getContactData()async{

    var response=await crud.postData(LinkApp.contactUs, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }








}