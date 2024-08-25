


import '../../../apilink.dart';
import '../../../core/class/crud.dart';

class Peymentsdata{
  Crud crud;
  Peymentsdata(this.crud);


  getCopon(String discountCode)async{

    var response=await crud.postData(LinkApp.getcopon, {
      "discount_code"   : discountCode.toString() ,






    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

  getAmountPayment()async{

    var response=await crud.postData(LinkApp.getamountpayments, {

    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

  addPayments(String userId, String paymentAmount, String payStatus)async{

    var response=await crud.postData(LinkApp.addpements, {
      "user_id"   : userId.toString() ,
      "payment_amount"   : paymentAmount.toString() ,

      "payment_status"   : payStatus.toString() ,







    });

    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data





}


}