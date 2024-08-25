


import '../../../apilink.dart';
import '../../../core/class/crud.dart';

class AddResult{
  Crud crud;
  AddResult(this.crud);


  postData(String userId,String testId,String personalityType,String resultsPercentage)async{

    var response=await crud.postData(LinkApp.addresult, {
      "user_id"   : userId.toString() ,
      "test_id"   : testId.toString() ,

      "personality_type"   : personalityType.toString() ,

      "results_percentage"   : resultsPercentage.toString() ,





    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

  getResults(String userId)async{

    var response=await crud.postData(LinkApp.getuserresult, {
      "userid"   : userId.toString() ,

    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }








}