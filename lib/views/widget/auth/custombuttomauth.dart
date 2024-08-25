import 'package:flutter/material.dart';
import 'package:zaid_mohamed_test/core/constant/colors.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const CustomButtomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: Color.fromRGBO(22, 217, 227, 1),
        textColor: Colors.white,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Ciro",
              fontSize: 13,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
      ),
    );
  }
}
