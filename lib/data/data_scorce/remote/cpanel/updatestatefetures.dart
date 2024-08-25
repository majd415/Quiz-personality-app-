
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class ShowFituresCpanel{
  Crud crud;
  ShowFituresCpanel(this.crud);



  getfituriesData(  )async{

    var response=await crud.postData(LinkApp.getfituriescpanel, {




    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  showfituriespositive(String positiveFetures )async{

    var response=await crud.postData(LinkApp.showfituriespositive, {
      "positive_fetures"     :positiveFetures,




    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  showfituriesnegative(String negativeFetures )async{

    var response=await crud.postData(LinkApp.showfituriesnegative, {
      "negative_fetures"     :negativeFetures,




    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

}