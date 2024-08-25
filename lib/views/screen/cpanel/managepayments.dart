
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaid_mohamed_test/core/class/handelingDataView.dart';
import 'package:zaid_mohamed_test/core/class/statusrequest.dart';

import '../../../controler/cpanel/pymentcpanelcontroller.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextformauth.dart';

class Managepayments extends StatelessWidget {
  const Managepayments({super.key});

  @override
  Widget build(BuildContext context) {

    PaymentsCpanelControllerImp controller=Get.put(PaymentsCpanelControllerImp());


    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          SizedBox(height: 30,),
          Center(child: Text("Manage Payments  "
            ,style: TextStyle(
                fontSize: 50,
                color: Colors.black45
                ,fontWeight: FontWeight.bold
            ),)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 296,
                  height: 172,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow : [BoxShadow(
                        color: Color.fromRGBO(48, 199, 236, 1),
                        offset: Offset(0,0),
                        blurRadius: 50
                    )],
                    image : DecorationImage(
                        image: AssetImage('assets/images/payscreen.png'),
                        fit: BoxFit.fill
                    ),
                  )
              ),
            ],
          ),
          Center(child: Text(" Amount for pay     "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
          SizedBox(height: 30,),


          GetBuilder<PaymentsCpanelControllerImp>(builder: (controller)=>
          controller.endamountList.length ==0? Center(child: LinearProgressIndicator()) :
          HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget:        Form(
                key: controller.formStatesendamountCpanel,
                child: Column(
                  children: [
                    ...List.generate(
                        controller.endamountList.length, (index) =>
                        Center(
                          child: Container(
                            width: 300,
                            height: 70,
                            child: CustomTextFormAuth(
                              mycontroller: controller.endamount,
                              iconData: Icons.money,
                              isNumber: false,
                              hinttext: "${controller.endamountList[index]["payamount"] } USD",
                              lable: " Update amount  ",
                              valid: (val) {
                                return validInput(val!, 1, 100, "Text");
                              },
                            ),
                          ),
                        ),

                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: IconButton(
                        icon: Icon(Icons.mobile_screen_share_outlined),
                        color: Colors.greenAccent,
                        onPressed: () {
                          controller.upadateendAmountCpanel();
                        },
                      ),
                    ),
                  ],
                ),
              ),)


          ),
          SizedBox(height: 20,),

          Center(child: Text(" All Discount Code   "
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
                  child: GetBuilder<PaymentsCpanelControllerImp>(builder: (controller)=>
                    HandlingDataView(

                        statusRequest: controller.statusRequest!,
                        widget: DataTable(

                          columns: [
                            DataColumn(label: Text('ID',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text('Code',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text('Amount',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text('Actions',style: TextStyle(fontWeight: FontWeight.bold),)),

                          ],

                          rows:controller.datacopon.map((user) {
                            return DataRow(cells: [
                              DataCell(Text(user['id_discount'].toString(),style: TextStyle(color: Colors.black),)),
                              DataCell(Text(user['discount_code'],style: TextStyle(color: Colors.black))),
                              DataCell(Text(user['discount_value'],style: TextStyle(color: Colors.black))),

                              DataCell(
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      color: Colors.red,
                                      onPressed: () {
                                       controller.deleteUsersdatacpanel(user['id_discount'].toString()) ;// إضافة منطق حذف المستخدم هنا
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                          }).toList(),
                        ),

                    ),)
                )

              ],
            ),
          ),
          SizedBox(height: 30,),

          Center(child: Text("Add Discount Code And Amount Of This Code   "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
          SizedBox(height: 30,),
          Form(
            key: controller.formStatesAddCoponCpanel,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          child: CustomTextFormAuth(
                             mycontroller: controller.code,
                            iconData: Icons.perm_identity,
                            isNumber: false,
                            hinttext: "add discount  Code      ",
                            lable: " Code ",
                            valid: (val) {
                              return validInput(val!, 5, 100, "Text");
                            },
                          ),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          child: CustomTextFormAuth(
                             mycontroller: controller.amount,

                            isNumber: true,

                            hinttext: " add amount ",
                            lable: "amount  ",
                            iconData: Icons.discount_outlined,
                            valid: (val){
                              return validInput(val!, 1, 100, "Number");

                            },
                          ),
                        ),

                      ],
                    ),


                  ],
                ),
                SizedBox(height: 20,),
                Center(
                  child: CustomButtomAuth(
                    onPressed: (){
                      controller.addCopon();
                    },
                    text: " Add Code ",
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),

          Center(child: Text(" information Paypal Account Developer API    "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
          SizedBox(height: 30,),


          GetBuilder<PaymentsCpanelControllerImp>(
              builder:
                  (controller)=>
                  controller.paypalInfoCpanel.length ==0?Center(child: LinearProgressIndicator()) :
              HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget:        Form(
                  key: controller.formStatesPaypalInfoCpanel,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 300,
                          height: 70,
                          child: CustomTextFormAuth(
                            mycontroller: controller.clientIdcontroller,
                            iconData: Icons.perm_identity,
                            isNumber: false,
                            hinttext: "${controller.paypalInfoCpanel[0]["clientId"] }",
                            lable: " clientId ",
                            valid: (val) {
                              return validInput(val!, 1, 100, "Text");
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          width: 300,
                          height: 70,
                          child:  CustomTextFormAuth(
                            mycontroller: controller.clientSecretcontrooler,
                            iconData: Icons.security,
                            isNumber: false,
                            hinttext: "${controller.paypalInfoCpanel[0]["clientSecret"] }",
                            lable: " clientSecret ",
                            valid: (val) {
                              return validInput(val!, 1, 100, "Text");
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          width: 300,
                          height: 70,
                          child:  CustomTextFormAuth(
                            mycontroller: controller.liveModecontrooler,
                            iconData: Icons.live_tv,
                            isNumber: false,
                            hinttext: "${controller.paypalInfoCpanel[0]["liveMode"] }",
                            lable: " liveMode ",
                            valid: (val) {
                              return validInput(val!, 1, 100, "Text");
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: IconButton(
                          icon: Icon(Icons.paypal),
                          color: Colors.blue,
                          onPressed: () {
                            controller.updatePaypalConnectionInfoCpanel();
                          },
                        ),
                      ),
                    ],
                  ),
                ),)),
          SizedBox(height: 30,),

          Center(child: Text("All Payments in System    "
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
                  child: GetBuilder<PaymentsCpanelControllerImp>( builder: (controller)=>
                    HandlingDataView(

                        statusRequest:controller.statusRequest! ,
                        widget: DataTable(

                          columns: [
                            DataColumn(label: Text('payment_id',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text('user_id',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text('payment_amount',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text('payment_status',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text('payment_date',style: TextStyle(fontWeight: FontWeight.bold),)),

                          ],

                          rows:controller.datapayments.map((user) {
                            return DataRow(cells: [
                              DataCell(Text(user['payment_id'].toString(),style: TextStyle(color: Colors.black),)),
                              DataCell(Text(user['user_id'],style: TextStyle(color: Colors.black))),
                              DataCell(Text(user['payment_amount'],style: TextStyle(color: Colors.black))),
                              DataCell(Text(user['payment_status'],style: TextStyle(color: Colors.black))),
                              DataCell(Text(user['payment_date'],style: TextStyle(color: Colors.black))),

                            ]);
                          }).toList(),
                        ),),)
                )

              ],
            ),
          ),









        ],
      ),
    );
  }
}
