import 'package:flutter/material.dart';

class CustomButtonAppbar extends StatelessWidget {


  final void Function()? onPressed;
  final String textbutton;
  final IconData iconData;
  final bool active;
  CustomButtonAppbar({super.key, required this.textbutton, required this.iconData ,required this.onPressed
    ,required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(


        onPressed: onPressed,
      child:    Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData,color: active==true ? Color.fromRGBO(22, 217, 227, 1):Colors.black,size: 35,),
          Text(textbutton,style: TextStyle(color: active==true ? Colors.black:Colors.black,
          fontSize: 10
          ),)
        ],
      ),



    );
  }
}
