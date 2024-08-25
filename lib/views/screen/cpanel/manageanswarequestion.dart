import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';

import '../../../controler/cpanel/manageanswarecontroller.dart';
import '../../../controler/cpanel/manageuserscpanelcontroller.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextformauth.dart';

class ManageAnswareAndQuestion extends StatelessWidget {
  const ManageAnswareAndQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    ManageAnswareCpanelControllerImp controller = Get.put(ManageAnswareCpanelControllerImp());

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              "Manage Answare And Question",
              style: TextStyle(
                fontSize: 50,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              "Edit Main Quistion",
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GetBuilder<ManageAnswareCpanelControllerImp>(builder: (controller)=>
          HandlingDataView(

              statusRequest: controller.statusRequest!,


              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(

                      controller.datamainquistion.length, (index) => Form(
                    key: controller.formStatesUpadeteMainQuestionCpanel,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 400,
                              height: 70,
                              child: CustomTextFormAuth(
                                mycontroller: controller.mainquestionArControllers,
                                iconData: Icons.quickreply,
                                isNumber: false,
                                hinttext: controller.datamainquistion[index]["question_text_ar"].toString(),
                                lable: "edit for ar",
                                valid: (val) {
                                  return validInput(val!, 1, 100, "text");
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 400,
                              height: 70,
                              child: CustomTextFormAuth(
                                mycontroller: controller.mainquestionEnControllers,
                                iconData: Icons.quickreply,
                                isNumber: false,
                                hinttext: controller.datamainquistion[index]["question_text_en"].toString(),
                                lable: "edit for en",
                                valid: (val) {
                                  return validInput(val!, 1, 100, "text");
                                },
                              ),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.move_up),
                              color: Colors.greenAccent,
                              onPressed: () {
                                controller.upadateArMainQuestion();
                                controller.upadateEnMainQuestion();

                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),)),
          SizedBox(height: 30),
          Center(
            child: Text(
              "Edit Adavantage",
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),
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
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GetBuilder<ManageAnswareCpanelControllerImp>(
                    builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest!,
                      widget: Column(
                        children: List.generate(controller.data.length, (index) {
                          return Form(
                            key: controller.formKeys[index],
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text('AR', style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('En', style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Actions',style: TextStyle(fontWeight: FontWeight.bold),)),

                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Row(
                                        children: [
                                          Container(
                                            width: 300,
                                            height: 70,
                                            child: CustomTextFormAuth(
                                              mycontroller: controller.artextControllers[index],
                                              iconData: Icons.person,
                                              isNumber: false,
                                              hinttext: controller.data[index]["answer_text"].toString(),
                                              lable: "edit for ar",
                                              valid: (val) {
                                                return validInput(val!, 1, 100, "text");
                                              },
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        children: [
                                          Container(
                                            width: 300,
                                            height: 70,
                                            child: CustomTextFormAuth(
                                              mycontroller: controller.entextControllers[index],
                                              iconData: Icons.person,
                                              isNumber: false,
                                              hinttext: controller.data[index]["answare_text_en"].toString(),
                                              lable: "edit for en",
                                              valid: (val) {
                                                return validInput(val!, 1, 100, "text");
                                              },
                                            ),
                                          ),
                                          // SizedBox(width: 10),
                                          // IconButton(
                                          //   icon: Icon(Icons.update),
                                          //   color: Colors.red,
                                          //   onPressed: () {
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                          DataCell(


                            Row(
                              children: [
                                SizedBox(width: 10),
                                IconButton(
                                  icon: Icon(Icons.update),
                                  color: Colors.red,
                                  onPressed: () {
                                    controller.upadateArAnsware(index, controller.data[index]['answer_id']);
                                    controller.upadateEnAnsware(index, controller.data[index]['answer_id']);

                                  },
                                ),
                              ],
                            )



                          )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
