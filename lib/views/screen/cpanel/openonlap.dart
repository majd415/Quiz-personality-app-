import 'package:flutter/material.dart';

class OpenOnLap extends StatelessWidget {
  const OpenOnLap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 30,),

          Container(
              width: 400,
              height: 500,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  border: Border.all(width: 10),
                  borderRadius: BorderRadius.circular(30)
                  ,image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/cpanel1.jpg",))
              )
          ),




          SizedBox(height: 30,),
          Center(child: Text("Open Cpanel on Laptop to Controll in your app  "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.redAccent
                ,fontWeight: FontWeight.bold
            ),))
        ],
      ),
    );
  }
}
