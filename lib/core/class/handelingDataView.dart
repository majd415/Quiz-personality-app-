import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zaid_mohamed_test/core/class/statusrequest.dart';
import 'package:zaid_mohamed_test/core/constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading ?
     Center(child: Lottie.asset(AppImageAsset.loading,width: 250,height: 250)):
    statusRequest == StatusRequest.offlineFailure ?
     Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250)) :
    statusRequest == StatusRequest.serverFailure ?
     Center(child:  Lottie.asset(AppImageAsset.server,width: 250,height: 250)):
     statusRequest == StatusRequest.failure?
      Center(child:  Lottie.asset(AppImageAsset.nodata,width: 250,height: 250) ) : widget;
  }
}
