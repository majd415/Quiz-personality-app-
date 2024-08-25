

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controler/cpanel/uploadcontroller.dart';
import '../../../controler/cpanel/uploadcontrollercautious.dart';
import '../../../controler/cpanel/uploadcontrollermoather.dart';
import '../../../controler/cpanel/uploadcontrollersteady.dart';

class Manageresultfile
extends StatelessWidget {
  const Manageresultfile({super.key});

  @override
  Widget build(BuildContext context) {

    ControllerDominantPositiveMoather controllerDominantPositiveMoather=Get.put(ControllerDominantPositiveMoather(uploadUrl: "https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/المؤثر/uploadPositive.php"));
    ControllerDominantNegativeMoather controllerDominantNegativeMoather=Get.put(ControllerDominantNegativeMoather(uploadUrl: "https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/المؤثر/uploadNegative.php"));
    UploadControllerDominantPositive controllerDominantPositiveDominant=Get.put(UploadControllerDominantPositive(uploadUrl: "https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/المسيطر/uploadPositive.php"));
    UploadControllerDominantNegative controllerDominantNegativeDominant=Get.put(UploadControllerDominantNegative(uploadUrl: "https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/المسيطر/uploadNegative.php"));
    ControllerDominantPositiveSteady controllerDominantPositiveSteady=Get.put(ControllerDominantPositiveSteady(uploadUrl: "https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/المستقر/uploadPositive.php"));
    ControllerDominantNegativeSteady controllerDominantNegativeSteady=Get.put(ControllerDominantNegativeSteady(uploadUrl: "https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/المستقر/uploadNegative.php"));
    ControllerDominantPositiveCautious controllerDominantPositiveCautious =Get.put(ControllerDominantPositiveCautious(uploadUrl: "https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/الحذر/uploadPositive.php"));
    ControllerDominantNegativeCautious controllerDominantNegativeCautious =Get.put(ControllerDominantNegativeCautious(uploadUrl: "https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/perResult/الحذر/uploadNegative.php"));

    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          SizedBox(height: 30,),
          Center(child: Text("Manage result file "
            ,style: TextStyle(
                fontSize: 30,
                color: Colors.orange
                ,fontWeight: FontWeight.bold
            ),)),
          SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            Text("Upload file for Influencer Personality Positive Ar "
              ,style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
                  ,fontWeight: FontWeight.bold
              ),),
            SizedBox(width: 30,),
            Obx(() {
              if (controllerDominantPositiveMoather.fileExists.value) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('File: ${controllerDominantPositiveMoather.fileName.value}'),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: controllerDominantPositiveMoather.deleteFile,
                      child: Text('Delete File'),
                    ),
                  ],
                );
              } else {
                return ElevatedButton(
                  onPressed: controllerDominantPositiveMoather.uploadFile,
                  child: Text('Upload File'),
                );
              }
            }),
          ],
        ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              Text("Upload file for Influencer Personality Negative Ar "
                ,style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                    ,fontWeight: FontWeight.bold
                ),),
              SizedBox(width: 30,),
              Obx(() {
                if (controllerDominantNegativeMoather.fileExists.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('File: ${controllerDominantNegativeMoather.fileName.value}'),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: controllerDominantNegativeMoather.deleteFile,
                        child: Text('Delete File'),
                      ),
                    ],
                  );
                } else {
                  return ElevatedButton(
                    onPressed: controllerDominantNegativeMoather.uploadFile,
                    child: Text('Upload File'),
                  );
                }
              }),
            ],
          ),
          /////dominat
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              Text("Upload file for Dominant  Personality Positive Ar "
                ,style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                    ,fontWeight: FontWeight.bold
                ),),
              SizedBox(width: 30,),
              Obx(() {
                if (controllerDominantPositiveDominant.fileExists.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('File: ${controllerDominantPositiveDominant.fileName.value}'),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: controllerDominantPositiveDominant.deleteFile,
                        child: Text('Delete File'),
                      ),
                    ],
                  );
                } else {
                  return ElevatedButton(
                    onPressed: controllerDominantPositiveDominant.uploadFile,
                    child: Text('Upload File'),
                  );
                }
              }),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              Text("Upload file for Dominant  Personality Negative Ar "
                ,style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                    ,fontWeight: FontWeight.bold
                ),),
              SizedBox(width: 30,),
              Obx(() {
                if (controllerDominantNegativeSteady.fileExists.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('File: ${controllerDominantNegativeDominant.fileName.value}'),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: controllerDominantNegativeDominant.deleteFile,
                        child: Text('Delete File'),
                      ),
                    ],
                  );
                } else {
                  return ElevatedButton(
                    onPressed: controllerDominantNegativeDominant.uploadFile,
                    child: Text('Upload File'),
                  );
                }
              }),
            ],
          ),
          /////dominat
          ///
          /////Steady
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              Text("Upload file for Steady  Personality Positive Ar "
                ,style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                    ,fontWeight: FontWeight.bold
                ),),
              SizedBox(width: 30,),
              Obx(() {
                if (controllerDominantPositiveSteady.fileExists.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('File: ${controllerDominantPositiveSteady.fileName.value}'),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: controllerDominantPositiveSteady.deleteFile,
                        child: Text('Delete File'),
                      ),
                    ],
                  );
                } else {
                  return ElevatedButton(
                    onPressed: controllerDominantPositiveSteady.uploadFile,
                    child: Text('Upload File'),
                  );
                }
              }),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              Text("Upload file for Steady  Personality Negative  Ar"
                ,style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                    ,fontWeight: FontWeight.bold
                ),),
              SizedBox(width: 30,),
              Obx(() {
                if (controllerDominantNegativeSteady.fileExists.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('File: ${controllerDominantNegativeSteady.fileName.value}'),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: controllerDominantNegativeSteady.deleteFile,
                        child: Text('Delete File'),
                      ),
                    ],
                  );
                } else {
                  return ElevatedButton(
                    onPressed: controllerDominantNegativeSteady.uploadFile,
                    child: Text('Upload File'),
                  );
                }
              }),
            ],
          ),
          /////Steady

          /////Cautious
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              Text("Upload file for Cautious  Personality Positive Ar "
                ,style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                    ,fontWeight: FontWeight.bold
                ),),
              SizedBox(width: 30,),
              Obx(() {
                if (controllerDominantPositiveCautious.fileExists.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('File: ${controllerDominantPositiveCautious.fileName.value}'),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: controllerDominantPositiveCautious.deleteFile,
                        child: Text('Delete File'),
                      ),
                    ],
                  );
                } else {
                  return ElevatedButton(
                    onPressed: controllerDominantPositiveCautious.uploadFile,
                    child: Text('Upload File'),
                  );
                }
              }),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              Text("Upload file for Cautious  Personality Negative  Ar"
                ,style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                    ,fontWeight: FontWeight.bold
                ),),
              SizedBox(width: 30,),
              Obx(() {
                if (controllerDominantNegativeCautious.fileExists.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('File: ${controllerDominantNegativeCautious.fileName.value}'),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: controllerDominantNegativeCautious.deleteFile,
                        child: Text('Delete File'),
                      ),
                    ],
                  );
                } else {
                  return ElevatedButton(
                    onPressed: controllerDominantNegativeCautious.uploadFile,
                    child: Text('Upload File'),
                  );
                }
              }),
            ],
          ),
          /////Cautious

        ],
      ),
    );
  }
}



