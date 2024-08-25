import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomBottonLang extends StatelessWidget {
  const CustomBottonLang({Key? key, required this.textbutton,this.onPressed}) : super(key: key);
final String textbutton;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return    Container(
      padding:const  EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed:  onPressed,
        color:Color.fromRGBO(22, 217, 227, 1) ,

        textColor: Colors.white,
        child: Text(textbutton,style: const TextStyle(
            fontWeight: FontWeight.bold
        ),
        ),

      ),
    );
  }
}
