import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomTextSignUpOrSingnIn extends StatelessWidget {
 final String textone;
 final String texttow;
 final void Function()? ontap;
 const CustomTextSignUpOrSingnIn({Key? key, required this.textone, required this.texttow, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: ontap,
          child: Text(texttow,style: const TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),)
      ],
    )
    ;
  }
}
