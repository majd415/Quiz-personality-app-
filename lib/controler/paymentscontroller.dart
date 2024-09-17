import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';
import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
import 'package:zaid_mohamed_test/core/constant/routes.dart';
import 'package:zaid_mohamed_test/core/services/services.dart';

import '../core/functions/handlinDataController.dart';
import '../data/data_scorce/remote/payments.dart';

abstract class PaymentsController extends GetxController {}

class PaymentsControllerImp extends PaymentsController {
  late TextEditingController codediscount;
  late StatusRequest statusRequest;
  Peymentsdata peymentsdata = Peymentsdata(Get.find());
  MysServices mysServices = Get.find();
  GlobalKey<FormState> formStatepayments = GlobalKey<FormState>();
  // late Map  paymentInfo={};

  late double copon=0;
  late double totalAmoun;
  late double endAmount = 0;
  List datacopn = [];
  List dataamount = [];
List dataPaypal=[];



  getCoponDiscount() async {
    var formdata = formStatepayments.currentState;

    if (formdata!.validate()) {
      datacopn.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await peymentsdata.getCopon(codediscount.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          datacopn.addAll(response['data']);
          copon = double.parse(datacopn[0]['discount_value']);
          endAmount = totalAmoun - copon;
          update();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      return " valid";
    } else {
      return "not valid";
    }
  }

  getamountpay() async {
    dataamount.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await peymentsdata.getAmountPayment();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        dataamount.addAll(response['data']);
        totalAmoun = double.parse(dataamount[0]['payamount']);
        endAmount = totalAmoun;
        print("getamountpay :: ${dataamount}");
        print("totalAmoun :: ${totalAmoun}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    codediscount = TextEditingController();
    // finalResultList = Get.arguments["finalResult"];
    // finalResultPercentageList = Get.arguments["finalResultPercentage"];
    // dataPaypal=Get.arguments["papalInfo"];
    await getamountpay();


    update();
    super.onInit();
  }

  paypaypal() {
    Get.to(
          () => PaypalCheckout(
        sandboxMode:dataPaypal[0]['liveMode']=="0"? true:false,
        clientId: '${dataPaypal[0]['clientId']}',
        secretKey: '${dataPaypal[0]['clientSecret']}',
        returnURL: "success.snippetcoder.com",
        cancelURL: "cancel.snippetcoder.com",
        transactions: [
          {
            "amount": {
              "total": "$endAmount",
              "currency": "USD",
              "details": {
                "subtotal": '${endAmount}',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "item_list": {
              "items": [
                {
                  "name": "Item 1",
                  "quantity": 1,
                  "price": '${endAmount}',  // تعيين price لقيمة endAmount
                  "currency": "USD"
                }

              ],
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          // paymentInfo=params;
          // addPeymentToDatabase();
          await Future.delayed(Duration(milliseconds: 500));
          // إضافة تأخير لتجنب التحطم

          Get.toNamed(AppRoute.testScreen);
        },
        onError: (error) {
          print("onError: $error");
          Get.back();
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    );
  }


  gototestscreen(){
    Get.toNamed(AppRoute.testScreen);
  }
  @override
  void onClose() {
    super.onClose();
  }
}









//
// import 'package:flutter/material.dart';
// import 'package:flutter_paypal_sdk/flutter_paypal_sdk.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../core/class/statusrequest.dart';
// import '../core/constant/routes.dart';
// import '../core/functions/handlinDataController.dart';
// import '../core/services/services.dart';
// import '../data/data_scorce/remote/payments.dart';
// import '../views/paypalweb.dart';
//
// class PaymentsControllerImp extends GetxController {
//   late TextEditingController codediscount;
//   late StatusRequest statusRequest;
//   Peymentsdata peymentsdata = Peymentsdata(Get.find());
//   MysServices mysServices = Get.find();
//   GlobalKey<FormState> formStatepayments = GlobalKey<FormState>();
//   late Map<String, dynamic> paymentInfo = {};
//
//   late double copon = 0;
//   late double totalAmoun;
//   late double endAmount = 0;
//   List datacopn = [];
//   List dataamount = [];
// List dataPaypal=[];
//   // late List<String> finalResultList;
//   // late List<double> finalResultPercentageList = [];
//
//   FlutterPaypalSDK? sdk;
//
//   @override
//   void onInit() async {
//     super.onInit();
//     statusRequest = StatusRequest.loading;
//     codediscount = TextEditingController();
//     // finalResultList = Get.arguments["finalResult"];
//     // finalResultPercentageList = Get.arguments["finalResultPercentage"];
//     // dataPaypal=Get.arguments["papalInfo"];
//     print(onInit);
//
//     print(dataPaypal);
//
//     await getamountpay();
//     sdk = FlutterPaypalSDK(
//       clientId: '${dataPaypal[0]['clientId']}',
//       clientSecret: '${dataPaypal[0]['clientSecret']}',
//       mode:dataPaypal[0]['liveMode']=="0"?Mode.sandbox:Mode.production , // استخدام وضع sandbox
//     );
//     update();
//   }
//   // sdk = FlutterPaypalSDK(
//   // clientId: 'Af6LUAzSc4e08lwJzBYafePel8YAo0rD29DlL4tTkZbsoFI2c-mUx_20jG1RUfhkRWwhAAMbRKlvvatb',
//   // clientSecret: 'EL5o_SBAwM6raADB77R2yyUqQOWp0qtpQg5we3_IWvuUuR2cJl06tFyv5yJIQAYdguM7QUHPEjPLulpi',
//   // mode: Mode.sandbox, // استخدام وضع sandbox
//   // );
//   Future<void> getamountpay() async {
//     dataamount.clear();
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await peymentsdata.getAmountPayment();
//     statusRequest = handlingData(response);
//
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         dataamount.addAll(response['data']);
//         totalAmoun = double.parse(dataamount[0]['payamount']);
//         endAmount = totalAmoun;
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
//
//   Future<String> getCoponDiscount() async {
//     var formdata = formStatepayments.currentState;
//
//     if (formdata!.validate()) {
//       datacopn.clear();
//       statusRequest = StatusRequest.loading;
//       update();
//       var response = await peymentsdata.getCopon(codediscount.text);
//       statusRequest = handlingData(response);
//
//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           datacopn.addAll(response['data']);
//           copon = double.parse(datacopn[0]['discount_value']);
//           endAmount = totalAmoun - copon;
//           update();
//           return "valid";
//         } else {
//           statusRequest = StatusRequest.failure;
//           update();
//           return "not valid";
//         }
//       }
//       update();
//       return "valid";
//     } else {
//       return "not valid";
//     }
//   }
//
//   Future<void> paypaypal() async {
//     try {
//       // الحصول على التوكن
//       AccessToken accessToken = await sdk!.getAccessToken();
//
//       if (accessToken.token != null) {
//         // إنشاء عملية الدفع
//         Payment payment = await sdk!.createPayment(
//           transaction(),
//           accessToken.token!,
//         );
// print(payment);
//         print(transaction);
//
//         print(accessToken.token!);
//
//         if (payment.status) {
//
//           print("payment.status");
//
//           paymentInfo['approveUrl'] = payment.approvalUrl!;
//           paymentInfo['executeUrl'] = payment.executeUrl!;
//           paymentInfo['accessToken'] = accessToken.token!;
//
//           // الانتقال إلى WebView للموافقة على الدفع
//           Get.to(() => PaypalWebview());
//         }
//       }
//     } catch (e) {
//       print("Error in PayPal payment process: $e");
//     }
//   }
//
//   Map<String, dynamic> transaction() {
//     return {
//       "intent": "sale",
//       "payer": {
//         "payment_method": "paypal",
//       },
//       "redirect_urls": {
//         "return_url": "/success",
//         "cancel_url": "/cancel",
//       },
//       'transactions': [
//         {
//           "amount": {
//             "currency": "USD",
//             "total": "$endAmount",
//           },
//         }
//       ],
//     };
//   }
//
//   void launchApproveUrl(BuildContext context) async {
//     if (await canLaunch(paymentInfo['approveUrl'])) {
//       await launch(paymentInfo['approveUrl']);
//
//       handlePaymentResponse(context);
//       print("paymentInfo paymentInfo paymentInfo");
//       print(paymentInfo);
//     } else {
//       throw 'Could not launch ${paymentInfo['approveUrl']}';
//     }
//   }
//   void handlePaymentResponse(BuildContext context) async {
//     Uri uri = Uri.parse(paymentInfo['approveUrl']);
//     String? payerId = uri.queryParameters['PayerID'];
//     print(" handlePaymentResponse ");
//     print(uri);
//     print(payerId);
//     if (payerId != null) {
//       await executePaymentWithPayerId(context, payerId);
//     } else {
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   SnackBar(content: Text('Invalid payment response.')),
//       // );
//       await addPeymentToDatabase();
//       await Future.delayed(Duration(milliseconds: 500));
//       Get.offNamed(AppRoute.testScreen, );
//     }
//   }
//
//   Future<void> executePaymentWithPayerId(BuildContext context, String payerId) async {
//     try {
//       Map<String, dynamic>? payment = await sdk!.executePayment(
//         paymentInfo['executeUrl'],
//         payerId,
//         paymentInfo['accessToken'],
//       );
//
//       if (payment != null && payment['status'] == 'success') {
//         await addPeymentToDatabase();
//         await Future.delayed(Duration(milliseconds: 500));
//         Get.offNamed(AppRoute.testScreen,);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Payment failed')),
//         );
//       }
//     } catch (e) {
//       print("Payment execution error: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Payment execution error')),
//       );
//     }
//   }
//
//   Future<void> addPeymentToDatabase() async {
//     try {
//       statusRequest = StatusRequest.loading;
//       update();
//       var transactions = paymentInfo['transactions'];
//       var payerInfo = paymentInfo['payer']['payer_info'];
//       if (transactions != null && transactions.isNotEmpty && payerInfo != null) {
//         var amount = transactions[0]['amount']['total'].toString();
//         var message = paymentInfo['message'].toString();
//         var response = await peymentsdata.addPayments(
//           mysServices.sharedPreferences.getString("id")!,
//           amount,
//           message,
//         );
//         statusRequest = handlingData(response);
//         if (StatusRequest.success == statusRequest &&
//             response['status'] == "success") {
//           print("Payments added to the database successfully.");
//         } else {
//           statusRequest = StatusRequest.failure;
//         }
//         update();
//       } else {
//         print("Error: Invalid paymentInfo structure.");
//       }
//     } catch (e) {
//       print("Exception in addPeymentToDatabase: $e");
//       statusRequest = StatusRequest.failure;
//       update();
//     }
//   }
// goptoresult(){
//   Get.offNamed(AppRoute.testScreen);
// }
//   @override
//   void onClose() {
//     codediscount.dispose();
//     super.onClose();
//   }
// }
