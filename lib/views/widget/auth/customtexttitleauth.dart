import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String title;

  const CustomTextTitleAuth({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,

    );
  }
}
