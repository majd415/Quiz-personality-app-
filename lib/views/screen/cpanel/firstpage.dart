import 'package:flutter/material.dart';

class FirstPageCpanel extends StatelessWidget {
  const FirstPageCpanel({super.key});

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
              image: AssetImage("assets/images/firstimagepage.png",))
            )
            ),




          SizedBox(height: 30,),
          Center(child: Text("Controll in your app  "
          ,style: TextStyle(
              fontSize: 30,
              color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),))
        ],
      ),
    );
  }
}
