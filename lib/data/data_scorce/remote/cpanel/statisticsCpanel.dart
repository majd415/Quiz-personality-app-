
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class StatisticsCpanel{
  Crud crud;
  StatisticsCpanel(this.crud);



  getAllStatisticsCpanel()async{

    var response=await crud.postData(LinkApp.getstatisticuser, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }


}