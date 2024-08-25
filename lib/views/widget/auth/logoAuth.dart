import 'package:flutter/cupertino.dart';
import 'package:zaid_mohamed_test/core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo,height: 170,);
  }
}
