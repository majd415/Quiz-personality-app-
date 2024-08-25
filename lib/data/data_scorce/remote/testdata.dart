


import '../../../apilink.dart';
import '../../../core/class/crud.dart';

class Testdata{
  Crud crud;
  Testdata(this.crud);


  postData(int groupAnswar)async{

    var response=await crud.postData(LinkApp.testapp, {
      "groupAnswar"   : groupAnswar.toString() ,




    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

  getpaypalinfo( )async{

    var response=await crud.postData(LinkApp.getpaypalinfo, {




    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
}