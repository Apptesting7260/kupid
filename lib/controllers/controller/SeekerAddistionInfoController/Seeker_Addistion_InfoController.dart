import 'dart:io';

import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../GlobalVariable/GlobalVariable.dart';
import '../../../match_maker/addbio_maker.dart';
import '../../../match_maker/verify_identity.dart';
import '../../../match_seeker/photos.dart';
import '../../../views/user/verification.dart';
import '../ForgotPasswordController/ForgotPasswordController.dart';
import '../OtpVarificationController/OtpVarificationController.dart';
import '../SetRoleController/SetRoleController.dart';
import 'package:get/get.dart';


var response;
class SeekerAddistionInfoController extends GetxController {

  final _api = AuthRepository();

  RxBool loading = false.obs;

  RxList<File> imageFiles = RxList<File>([]);

  final BioTitleController = TextEditingController().obs;
  final BioDescriptionController = TextEditingController().obs;


  Future<void> SeekerProfileApiHit() async {
    loading.value = true ;
    try {
      // Replace 'your_api_endpoint' with the actual URL of your API endpoint for file upload
      var url = Uri.parse('https://urlsdemo.xyz/kupid/api/seeker/seeker-update-additional-info');

      // Create the multipart request
      var request = http.MultipartRequest('POST', url);

      // Add the file to the request
      var fileStream1 = http.ByteStream(imageFiles[0]!.openRead());
      var length1 = await imageFiles[0]!.length();
      var multipartFile1 = http.MultipartFile('gallery[img1]', fileStream1, length1,

          filename: imageFiles[0]!.path.split('/').last);
      request.files.add(multipartFile1);

      ////////////////////////////////////////////

      // Add the file to the request
      var fileStream2 = http.ByteStream(imageFiles[1]!.openRead());
      var length2 = await imageFiles[1]!.length();
      var multipartFile2 = http.MultipartFile('gallery[img1]', fileStream2, length2,

          filename: imageFiles[1]!.path.split('/').last);
      request.files.add(multipartFile2);

      ////////////////////////////////////////////

      // Add the file to the request
      var fileStream3 = http.ByteStream(imageFiles[2]!.openRead());
      var length3 = await imageFiles[2]!.length();
      var multipartFile3 = http.MultipartFile('gallery[img1]', fileStream3, length3,

          filename: imageFiles[2]!.path.split('/').last);
      request.files.add(multipartFile3);

      ////////////////////////////////////////////

      // Add the file to the request
      var fileStream4 = http.ByteStream(imageFiles[3]!.openRead());
      var length4 = await imageFiles[3]!.length();
      var multipartFile4 = http.MultipartFile('gallery[img1]', fileStream4, length4,

          filename: imageFiles[3]!.path.split('/').last);
      request.files.add(multipartFile4);

      ////////////////////////////////////////////

      // Add the file to the request
      var fileStream5 = http.ByteStream(imageFiles[4]!.openRead());
      var length5 = await imageFiles[4]!.length();
      var multipartFile5 = http.MultipartFile('gallery[img1]', fileStream5, length5,

          filename: imageFiles[4]!.path.split('/').last);
      request.files.add(multipartFile5);

      ////////////////////////////////////////////

      // Add the file to the request
      var fileStream6 = http.ByteStream(imageFiles[5]!.openRead());
      var length6 = await imageFiles[5]!.length();
      var multipartFile6 = http.MultipartFile('gallery[img1]', fileStream6, length6,

          filename: imageFiles[5]!.path.split('/').last);
      request.files.add(multipartFile6);

      ////////////////////////////////////////////

      // Add the file to the request
      var fileStream7 = http.ByteStream(imageFiles[6]!.openRead());
      var length7 = await imageFiles[6]!.length();
      var multipartFile7 = http.MultipartFile('gallery[img1]', fileStream7, length7,

          filename: imageFiles[6]!.path.split('/').last);
      request.files.add(multipartFile7);

      ////////////////////////////////////////////

      // Add the file to the request
      var fileStream8 = http.ByteStream(imageFiles[7]!.openRead());
      var length8 = await imageFiles[7]!.length();
      var multipartFile8 = http.MultipartFile('gallery[img1]', fileStream8, length8,

          filename: imageFiles[7]!.path.split('/').last);
      request.files.add(multipartFile8);

      ////////////////////////////////////////////

      // Add the file to the request
      var fileStream9 = http.ByteStream(imageFiles[8]!.openRead());
      var length9 = await imageFiles[8]!.length();
      var multipartFile9 = http.MultipartFile('gallery[img1]', fileStream9, length9,

          filename: imageFiles[8]!.path.split('/').last);
      request.files.add(multipartFile9);

      ////////////////////////////////////////////
      print(imgFile);
      // Add other text fields to the request+
      request.fields['bio_title'] = BioTitleController.value.text;
      request.fields['bio_description'] = BioDescriptionController.value.text;
      request.fields['intrested_in'] = IntrestedIn.toString();
      request.fields['interests'] = Interests.toString();
      request.headers['Authorization'] = "Bearer $BarrierToken";
//       var videoStream = http.ByteStream(videoFile!.openRead());
//       var videoLength = await videoFile!.length();
//       var videoFileField = http.MultipartFile('pro_vedio', videoStream, videoLength, filename: videoFile!.path.split('/').last);
//       request.files.add(videoFileField);
// print(videoFile);
      print(BarrierToken);
      // Send the request and get the response
      response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print(responseBody);
      // Check the response status
      if (response.statusCode== 200) {
        print('File uploaded successfully!');
        Get.to(() => PhotosScreen());
        loading.value = false ;
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        loading.value = false ;
      }
    } catch (e) {
      loading.value = false ;
      print(response);
      print('Error occurred while uploading file: $e');
    }
  }



}
