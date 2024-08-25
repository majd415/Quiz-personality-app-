import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../../../controler/cpanel/cpanelscreen_controller.dart';

class CPanelScreen extends StatelessWidget {
  const CPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CpanelScreenControllerImp());

    return GetBuilder<CpanelScreenControllerImp>(builder: (controller) =>
        Scaffold(
          // appBar: AppBar(
          //   title: Center(
          //     child: Image(
          //       image: AssetImage("assets/images/cpanel1.jpg"),
          //       fit: BoxFit.cover,
          //       width: 400,
          //       height: 200,
          //     ),
          //   ),
          //   centerTitle: true,
          // ),
          body: Row(
            children: [
              // الشريط الجانبي
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),

                  gradient: LinearGradient(
                      begin: Alignment(6.123234262925839e-17, 1),
                      end: Alignment(-1, 6.123234262925839e-17),
                      colors: [
                        Color.fromRGBO(22, 217, 227, 1),
                        Color.fromRGBO(35, 208, 231, 1),
                        Color.fromRGBO(48, 199, 236, 1)
                      ]),
                ), // يمكنك تغيير اللون حسب الرغبة
                child: ListView(
                  children: <Widget>[
                    DrawerHeader(

                      child: Center(
                        child: Text(
                          'Controll your app',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),

                      ),
                    ),
                    Container(
                      color:controller.currentpage==0?Colors.orangeAccent: null ,

                      child: ListTile(
                        leading:
                             Icon(Icons.home),
                        title: const Text('Introduction',
                        ),
                        onTap: () {
                          controller.changePage(0);
                        },
                      ),
                    ),
                    Container(
                      color:controller.currentpage==1?Colors.orangeAccent: null ,

                      child: ListTile(
                        leading: Icon(Icons.supervised_user_circle),
                        title: Text('Manage Users'),
                        onTap: () {
                          controller.changePage(1);
                        },
                        selectedColor: Colors.orangeAccent,

                      ),
                    ),
                    Container(
                      color:controller.currentpage==2?Colors.orangeAccent: null ,

                      child: ListTile(
                        leading: Icon(Icons.contact_phone),
                        title: Text('Manage Contact'),
                        onTap: () {
                          controller.changePage(2);
                        },
                        selectedColor: Colors.orangeAccent,

                      ),
                    ),
                    Container(
                      color:controller.currentpage==3?Colors.orangeAccent: null ,

                      child: ListTile(
                        leading: Icon(Icons.edgesensor_high),
                        title: Text('Manage Fetures'),
                        onTap: () {
                          controller.changePage(3);
                        },
                        selectedColor: Colors.orangeAccent,

                      ),
                    ),
                    Container(
                      color:controller.currentpage==4?Colors.orangeAccent: null ,

                      child: ListTile(
                        leading: Icon(Icons.payment_rounded),
                        title: Text('Manage payments '),
                        onTap: () {
                          controller.changePage(4);
                        },
                        selectedColor: Colors.orangeAccent,

                      ),
                    ),
                    Container(
                      color:controller.currentpage==5?Colors.orangeAccent: null ,

                      child: ListTile(
                        leading: Icon(Icons.file_present_outlined),
                        title: Text('Manage result file '),
                        onTap: () {
                          controller.changePage(5);
                        },
                        selectedColor: Colors.orangeAccent,

                      ),
                    ),
                    Container(
                      color:controller.currentpage==6?Colors.orangeAccent: null ,

                      child: ListTile(
                        leading: Icon(Icons.stacked_bar_chart_sharp),
                        title: Text('Statistics for users '),
                        onTap: () {
                          controller.changePage(6);
                        },
                        selectedColor: Colors.orangeAccent,

                      ),
                    ),
                    Container(
                      color:controller.currentpage==6?Colors.orangeAccent: null ,

                      child: ListTile(
                        leading: Icon(Icons.question_answer),
                        title: Text('Manage Answare   '),
                        onTap: () {
                          controller.changePage(7);
                        },
                        selectedColor: Colors.orangeAccent,

                      ),
                    ),
                    // أضف بقية العناصر هنا
                  ],
                ),
              ),
              // المحتوى الرئيسي
              Expanded(
                child: controller.listPage[controller.currentpage],
              ),
            ],
          ),
        )
    );
  }
}
