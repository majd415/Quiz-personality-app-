import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controler/homescreen_controller.dart';
import 'custombottomappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeScreenControllerImp>(builder: (controller)=>
        BottomAppBar(
          color: Colors.white,
            shape: CircularNotchedRectangle(
            ),
            notchMargin: 7,
            child:Row(
            
              children: [
                ...List.generate(controller.listPage.length +1, (index){
                  int i=index>2?index-1:index;
                  return index==2? Spacer(

                  ) :Flexible(
                    flex: 4,
                    child: CustomButtonAppbar(



                      onPressed: (){
                        controller.changePage(i);
                      },
                       iconData: controller.iconbuttonappbar[i],
                      textbutton: controller.titlebuttonappbar[i],
                      active: controller.currentpage==i?true:false,

                    ),
                  );


                })

              ],
            )


        ));
  }
}
//Flexible(
//                     flex: 4,