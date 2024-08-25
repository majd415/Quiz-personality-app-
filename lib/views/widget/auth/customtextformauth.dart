import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String lable;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;

  final bool? obscureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth(
      {super.key, required this.hinttext, required this.lable, required this.iconData, this.mycontroller, this.valid, required this.isNumber, this.obscureText, this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
        child: TextFormField(
style: TextStyle(color: Colors.black),
          controller: mycontroller,
          keyboardType:isNumber ?TextInputType.numberWithOptions(decimal: true):TextInputType.text ,
          validator: valid,
          decoration:InputDecoration(


            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding:
    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    label: Container(
    margin: const EdgeInsets.symmetric(horizontal: 9),
    child: Text(lable)),
            suffixIcon:InkWell(onTap:onTapIcon ,child: Icon(iconData)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
            ),



          ) ,
          obscureText:obscureText == null || obscureText == false ? false : true ,






        ));
  }
}
