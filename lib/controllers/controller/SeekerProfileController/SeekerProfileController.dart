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
class SeekerProfileController extends GetxController {

  final _api = AuthRepository();

  RxBool loading = false.obs;



  final NameController = TextEditingController().obs;
  final EmailController = TextEditingController().obs;
  final PhoneController = TextEditingController().obs;
  final TypeController = TextEditingController().obs;
   final OccupationController = TextEditingController().obs;
  final AddressController = TextEditingController().obs;
  final HeightController = TextEditingController().obs;
  final InchesController = TextEditingController().obs;
  final QuestionController = TextEditingController().obs;
  final FirstanswerController = TextEditingController().obs;
  final SecondanswerController = TextEditingController().obs;
  final ThirdanswerController = TextEditingController().obs;
   final CorrectanswerController = TextEditingController().obs;

  Future<void> SeekerProfileApiHit() async {
    loading.value = true ;
    try {
      // Replace 'your_api_endpoint' with the actual URL of your API endpoint for file upload
      var url = Uri.parse('https://urlsdemo.xyz/kupid/api/user-profile-update');

      // Create the multipart request
      var request = http.MultipartRequest('POST', url);

      // Add the file to the request
      var fileStream = http.ByteStream(imgFile!.openRead());
      var length = await imgFile!.length();
      var multipartFile = http.MultipartFile('pro_img', fileStream, length,
          filename: imgFile!.path.split('/').last);
      request.files.add(multipartFile);
  print(imgFile);
      // Add other text fields to the request+
      request.fields['name'] = NameController.value.text;
      request.fields['email'] = EmailController.value.text;
      request.fields['phone'] = PhoneController.value.text;
      request.fields['address'] = AddressController.value.text;
      request.fields['height'] = HeightController.value.text + "." + InchesController.value.text;
      request.fields['question'] = QuestionController.value.text;
      request.fields['first_answer'] = FirstanswerController.value.text;
      request.fields['second_answer'] = SecondanswerController.value.text;
      request.fields['third_answer'] = ThirdanswerController.value.text;
      request.fields['correct_answer'] = choose!;
      request.fields['dob'] = datestring.toString();
      request.fields['location'] = SelectedLocation.toString();
      request.fields['occupation'] = Ocupasion.toString();
      request.fields['gender'] = SelectedGender.toString();
      request.fields['type'] = "2";
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
