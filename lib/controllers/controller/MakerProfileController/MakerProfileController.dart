import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
import 'package:cupid_match/match_maker/addbio_maker.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../GlobalVariable/GlobalVariable.dart';
import '../../../match_maker/verify_identity.dart';
import '../../../views/user/verification.dart';
import '../ForgotPasswordController/ForgotPasswordController.dart';
import '../OtpVarificationController/OtpVarificationController.dart';
import 'package:http/http.dart' as http;


class MakerProfileController extends GetxController {

  final _api = AuthRepository();

  RxBool loading = false.obs;

  final ProfileImageController = TextEditingController().obs;
  final UpdateTypeController = TextEditingController().obs;
  final NameController = TextEditingController().obs;
  final EmailController = TextEditingController().obs;
  final PhoneController = TextEditingController().obs;
  final DobController = TextEditingController().obs;

  final AboutMakerController = TextEditingController().obs;
  final ExpectFromSeekerController = TextEditingController().obs;
  final HandlingOfMakerController = TextEditingController().obs;
  final TypeController = TextEditingController().obs;

  // void MakerProfileApiHit(){
  //   loading.value = true ;
  //   print(loading.value);
  //   Map data = {
  //   'update_type' : "profile",
  //     'name' : NameController.value.text,
  //     'email' : EmailController.value.text,
  //     'phone' : PhoneController.value.text,
  //     'dob' : datestring.toString(),
  //     'gender' :SelectedGender.toString(),
  //     'location' : SelectedLocation.toString(),
  //     'experience' : SelectedMtachMakerExperience.toString(),
  //     'about_maker' : AboutMakerController.value.text,
  //     'expect_from_seeker' : ExpectFromSeekerController.value.text,
  //     'heading_of_maker' : HandlingOfMakerController.value.text,
  //    "pro_img" :imgFile,
  //     'type' : '2',
  //   };
  //   print(data);
  //   _api.MakerProfileApi(data).then((value){
  //     loading.value = false ;
  //     print(value);
  //     Utils.snackBar( "Message",value.msg.toString());
  //     Get.to(VerifyScreen());

  //   }).onError((error, stackTrace){
  //     print(error.toString());
  //     loading.value = false ;
  //     Utils.snackBar('Error', error.toString());
  //   });
  // }


Future<void> MakerProfileApiHit() async {
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

    // Add other text fields to the request
    request.fields['name'] = NameController.value.text;
    request.fields['email'] = EmailController.value.text;
    request.fields['phone'] = PhoneController.value.text;
    request.fields['dob'] = datestring.toString();
    request.fields['location'] = SelectedLocation.toString();
    request.fields['experience'] = SelectedMtachMakerExperience.toString();
    request.fields['about_maker'] = AboutMakerController.value.text;
    request.fields['expect_from_seeker'] = AboutMakerController.value.text;
    request.fields['heading_of_maker'] = HandlingOfMakerController.value.text;
    request.fields['type'] = "1";
    request.headers['Authorization'] = "Bearer $BarrierToken";
     var videoStream = http.ByteStream(videoFile!.openRead());
    var videoLength = await videoFile!.length();
      var videoFileField = http.MultipartFile('pro_vedio', videoStream, videoLength, filename: videoFile!.path.split('/').last);
    request.files.add(videoFileField);

print(BarrierToken);
    // Send the request and get the response
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
print(responseBody);
    // Check the response status
    if (response.statusCode== 200) {
      print('File uploaded successfully!');
    } else {
      print('Failed to upload file. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred while uploading file: $e');
  }
}


}