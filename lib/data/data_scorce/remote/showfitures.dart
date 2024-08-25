


import '../../../apilink.dart';
import '../../../core/class/crud.dart';

class ShowFitures{
  Crud crud;
  ShowFitures(this.crud);



  getFitures()async{

    var response=await crud.postData(LinkApp.showfitures, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }








}