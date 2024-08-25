import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class ControllerDominantPositiveMoather extends GetxController {
  ControllerDominantPositiveMoather({required this.uploadUrl});
  var fileExists = false.obs;
  var fileName = ''.obs;
  final String uploadUrl ;//= 'https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/upload/uploadPositive.php';

  @override
  void onInit() {
    super.onInit();
    checkFile();
  }

  Future<void> checkFile() async {
    try {
      final response = await http.get(Uri.parse(uploadUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['file_exists']) {
          fileExists.value = true;
          fileName.value = data['file_name'];
        } else {
          fileExists.value = false;
        }
      } else {
        throw Exception('Failed to load file status');
      }
    } catch (e) {
      print('Error: $e');
      fileExists.value = false;
    }
  }

  Future<void> uploadFile() async {
    if (fileExists.value) {

      Get.snackbar('Error', 'File already exists',
      backgroundColor: Color(Colors.redAccent as int),
      );
      return;
    }
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.single.bytes != null) {
      final fileBytes = result.files.single.bytes;
      final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      request.files.add(http.MultipartFile.fromBytes('file', fileBytes!, filename: 'positive.pdf'));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);
        if (data['success'] != null) {
          Get.snackbar('Success', data['success'],
              backgroundColor:Colors.greenAccent          );
          checkFile();
        } else {
          Get.snackbar('Error', data['error'],
            backgroundColor:Colors.greenAccent, );
        }
      } else {
        Get.snackbar('Error', 'Failed to upload file',
          backgroundColor:Colors.redAccent,);
      }
    }
  }

  Future<void> deleteFile() async {
    final response = await http.delete(Uri.parse(uploadUrl));
    final data = json.decode(response.body);
    if (data['success'] != null) {
      Get.snackbar('Success', data['success'],
        backgroundColor:Colors.greenAccent,);
      checkFile();
    } else {
      Get.snackbar('Error', data['error'],
        backgroundColor:Colors.redAccent,);
    }
  }
}
class ControllerDominantNegativeMoather extends GetxController {
  ControllerDominantNegativeMoather({required this.uploadUrl});

  var fileExists = false.obs;
  var fileName = ''.obs;
  final String uploadUrl ;//= 'https://dr-mohammad-taamnha.com/app_zaid/app_zaid/test/upload/uploadNegative.php';

  @override
  void onInit() {
    super.onInit();
    checkFile();
  }

  Future<void> checkFile() async {
    try {
      final response = await http.get(Uri.parse(uploadUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['file_exists']) {
          fileExists.value = true;
          fileName.value = data['file_name'];
        } else {
          fileExists.value = false;
        }
      } else {
        throw Exception('Failed to load file status');
      }
    } catch (e) {
      print('Error: $e');
      fileExists.value = false;
    }
  }

  Future<void> uploadFile() async {
    if (fileExists.value) {
      Get.snackbar('Error', 'File already exists');
      return;
    }
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.single.bytes != null) {
      final fileBytes = result.files.single.bytes;
      final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      request.files.add(http.MultipartFile.fromBytes('file', fileBytes!, filename: 'positive.pdf'));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);
        if (data['success'] != null) {
          Get.snackbar('Success', data['success']);
          checkFile();
        } else {
          Get.snackbar('Error', data['error']);
        }
      } else {
        Get.snackbar('Error', 'Failed to upload file');
      }
    }
  }

  Future<void> deleteFile() async {
    final response = await http.delete(Uri.parse(uploadUrl));
    final data = json.decode(response.body);
    if (data['success'] != null) {
      Get.snackbar('Success', data['success']);
      checkFile();
    } else {
      Get.snackbar('Error', data['error']);
    }
  }
}

