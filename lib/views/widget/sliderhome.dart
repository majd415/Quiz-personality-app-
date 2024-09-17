
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.context!.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0,
      left: 10,
      right: 10),
      child: Container(
        width: 375,
        // height: 230,
        height: screenWidth > 600? 500 : 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          // image : DecorationImage(
          //     image: AssetImage('assets/images/Rectangle13.png'),
          //     fit: BoxFit.fitWidth
          // ),
        ),
        child: AnotherCarousel(
          boxFit:screenWidth > 600? BoxFit.fitWidth : BoxFit.cover ,

          images: [
            // NetworkImage(
            //     'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),

            AssetImage("assets/images/s4.jpg"),
            AssetImage("assets/images/s3.jpg",),
            AssetImage("assets/images/s2.jpg"),




          ],
          dotSize: 5.0,
          dotSpacing: 20.0,
          dotColor: Colors.lightGreenAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Color.fromRGBO(13, 16, 16, 0.6392156862745098).withOpacity(0.1),
          borderRadius: true,
          radius: Radius.circular(50),

          animationCurve: Curves.bounceIn,


        ),
      ),
    );
  }
}
