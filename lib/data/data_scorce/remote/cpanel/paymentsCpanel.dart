
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class PaymentsCpanel{
  Crud crud;
  PaymentsCpanel(this.crud);


  addNewCoponCpanel(String discountcode,String discountvalue)async{

    var response=await crud.postData(LinkApp.addnewcoponCpanel, {

      "discount_code" :discountcode ,
      "discount_value"   : discountvalue ,
    


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  deleteCoponCpanel(String coponid)async{

    var response=await crud.postData(LinkApp.deletecoponsCpanel, {

      "id_discount" :coponid ,



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  getallCoponsCpanel()async{

    var response=await crud.postData(LinkApp.getallcoponsCpanel, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  getallPaymentsCpanel()async{

    var response=await crud.postData(LinkApp.getallpeyments, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  getAmountCpanel()async{

    var response=await crud.postData(LinkApp.getamountCpanel, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  updateAmountCpanel(String amount)async{

    var response=await crud.postData(LinkApp.updateamountCpanel, {
      "payamount"     :amount,


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  getInfoPaypalCpanel()async{

    var response=await crud.postData(LinkApp.getinfoPaypalCpanel, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  updateInfoPaypalCpanel(String clientId,String clientSecret,String  liveMode)async{

    var response=await crud.postData(LinkApp.updateInfoPaypalCpanel, {
      "clientId"     :clientId,
      "clientSecret"     :clientSecret,

      "liveMode"     :liveMode,



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
}