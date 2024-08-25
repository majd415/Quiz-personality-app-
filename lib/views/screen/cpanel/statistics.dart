
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../../controler/cpanel/statistucscpanelcontroller.dart';

class StatisticsCpanel extends StatelessWidget {
  const StatisticsCpanel({super.key});

  @override
  Widget build(BuildContext context) {

    StatisticsCpanelControllerImp controller=Get.put(StatisticsCpanelControllerImp());
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          SizedBox(height: 30,),
          Center(child: Text("Statistics For All Users"
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
          SizedBox(height: 30,),





          Container(
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
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GetBuilder<StatisticsCpanelControllerImp>(builder: (controller)=>
                    HandlingDataView(
                        statusRequest: controller.statusRequest!,
                        widget: DataTable(
                          columnSpacing: 70,
                          dataRowHeight: 100,columns: [
                          DataColumn(label: Text('result_id',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('user_id',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('test_id',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('user_name',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('personality_type',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('results_percentage',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('Created At',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],

                          rows:controller.data.map((user) {
                            return DataRow(cells: [
                              DataCell(Text(user['result_id'].toString(),style: TextStyle(color: Colors.black),)),
                              DataCell(Text(user['user_id'].toString(),style: TextStyle(color: Colors.black))),
                              DataCell(Text(user['test_id'].toString(),style: TextStyle(color: Colors.black))),
                              DataCell(Text(user['user_name'].toString(),style: TextStyle(color: Colors.black))),
                              DataCell(Text(user['personality_type'].toString(),style: TextStyle(color: Colors.black))),
                              DataCell(

                                Container(

                                  margin:EdgeInsets.only(right: 10) ,
                                  child: CircularPercentIndicator(
                                    radius: 30.0,
                                    lineWidth: 5.0,
                                    percent: double.parse(user['results_percentage'])/100,
                                    animation: true,
                                    animationDuration: 3000,
                                    center: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${double.parse(user['results_percentage'])}",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                                              color: Colors.blue),
                                        ),

                                      ],
                                    ),
                                    backgroundColor: Colors.blueGrey,
                                    progressColor: Colors.black,
                                  ),
                                ),
                                ///////

                              ),
                              DataCell(Text(user['created_at'],style: TextStyle(color: Colors.black))),
                            ]);
                          }).toList(),
                        )

                    )
                    ,),
                )

              ],
            ),
          )
        ],
      ),
    );
  }

}
