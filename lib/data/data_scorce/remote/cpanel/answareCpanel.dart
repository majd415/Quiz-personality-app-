
import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';


class AnswareDataCpanel{
  Crud crud;
  AnswareDataCpanel(this.crud);



  getallAnswareCpanel()async{

    var response=await crud.postData(LinkApp.getallanswareCpanel, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  updateAnswareDataARCpanel(String id,String artext)async{

    var response=await crud.postData(LinkApp.editarAnswareCpanel, {
      "idaransware"     :id,
      "aransware" :artext ,



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

  updateAnswareDataENCpanel(String id,String entext)async{

    var response=await crud.postData(LinkApp.editenAnswareCpanel, {
      "idaransware"     :id,
      "enansware" :entext ,



    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }

  /////questin
  getMainQuestionCpanel()async{

    var response=await crud.postData(LinkApp.getmainquistionCpanel, {


    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  updateMainQuestionDataARCpanel(String textquestion)async{

    var response=await crud.postData(LinkApp.editmainquistionArCpanel, {
      "questiontextar"     :textquestion,




    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }
  updateMainQuestionDataEnCpanel(String textquestion)async{

    var response=await crud.postData(LinkApp.editmainquistionEnCpanel, {
      "questiontexten"     :textquestion,




    });
    return response.fold((l) => l, (r) => r);//we use this fold because we have tow value we used it before right and lift /failure or get data
  }


}