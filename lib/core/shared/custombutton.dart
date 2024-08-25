import 'package:flutter/material.dart';
import 'package:zaid_mohamed_test/core/constant/colors.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomButtom({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 5),
        onPressed: onPressed,color: AppColor.primaryColor,
        textColor: Colors.white,child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
    );
  }
}
