//
// //date z package for function programing we use it for return tow kindof data like here in this ex :
// //Either<StatusRequest,Map>
// import 'dart:convert';
//
// import 'package:dartz/dartz.dart';
// import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
// import 'package:zaid_mohamed_test/core/functions/checkenternet.dart';
// import 'package:http/http.dart' as http;
// class Crud{
// Future<Either<StatusRequest,Map>>postData(String linkurl,Map data)async{
// try{
//   if( await checkEnternet()){
//     print("this ---------------falure 4");
//
//     //
//     var response= await http.post(Uri.parse(linkurl),body: data);
//    //
//     if(response.statusCode ==200 || response.statusCode==201){
//       var responsebody= jsonDecode(response.body);
//       print("this ---------------falure 2");
//       return  Right(responsebody);
//     }else{
//       print("this ---------------falure 1");
//       return const Left(StatusRequest.serverFailure);
//     }
//
//
//
//   }else {
//
//     return const Left(StatusRequest.offlineFailure);
//
//   }
//
//
// }catch(_){
//   print("this ---------------falure 3");
//   return const Left(StatusRequest.offlineException);
// }
//
// }
//
//
//
// }

// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
// import 'package:zaid_mohamed_test/core/functions/checkenternet.dart';
// import 'package:http/http.dart' as http;
//
// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     try {
//       if (await checkEnternet()) {
//         print("Checking internet connection...");
//
//         var response = await http.post(
//           Uri.parse(linkurl),
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//           },
//           body: jsonEncode(data),
//         );
//
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           var responsebody = jsonDecode(response.body);
//           print("Request successful, response: $responsebody");
//           return Right(responsebody);
//         } else {
//           print("Server failure with status code: ${response.statusCode}");
//           return const Left(StatusRequest.serverFailure);
//         }
//       } else {
//         print("No internet connection.");
//         return const Left(StatusRequest.offlineFailure);
//       }
//     } catch (e) {
//       print("Exception caught: $e");
//       return const Left(StatusRequest.offlineException);
//     }
//   }
// }
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
import 'package:zaid_mohamed_test/core/functions/checkenternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkEnternet()) {
        print("Checking internet connection...");

        var response = await http.post(
          Uri.parse(linkurl),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(data),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          print("Request successful, response: $responsebody");
          return Right(responsebody);
        } else {
          print("Server failure with status code: ${response.statusCode}");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        print("No internet connection.");
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("Exception caught: $e");
      return const Left(StatusRequest.offlineException);
    }
  }
}
