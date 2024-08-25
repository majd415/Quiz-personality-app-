





import '../../../apilink.dart';
import '../../../core/class/crud.dart';

class GetQuestionData{
  Crud crud;
  GetQuestionData(this.crud);


  getquestiondata()async{

    var response=await crud.postData(LinkApp.getquestion, {



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }




}