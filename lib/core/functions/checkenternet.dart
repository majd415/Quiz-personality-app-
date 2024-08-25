
// import 'package:http/http.dart' as http;
//
// Future<bool> checkEnternet() async {
//   try {
//     final response = await http.get(Uri.parse('https://dr-mohammad-taamnha.com'));
//     if (response.statusCode == 200) {
//       return true;
//     }
//   } catch (e) {
//     print("Failed to connect to the internet: $e");
//   }
//   return false;
// }
import 'dart:io';

checkEnternet() async{

  try{
    var result=await InternetAddress.lookup("google.com");
    if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
      print("this ---------------entarnet yes");
      return true;
    }

  }on SocketException catch(_){
    print("this ---------------entarnet no");

    return false;

  }




}