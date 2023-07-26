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

  void MakerProfileApiHit(){
    loading.value = true ;
    print(loading.value);
    Map data = {
    'update_type' : "profile",
      'name' : NameController.value.text,
      'email' : EmailController.value.text,
      'phone' : PhoneController.value.text,
      'dob' : datestring.toString(),
      'gender' :SelectedGender.toString(),
      'location' : SelectedLocation.toString(),
      'experience' : SelectedMtachMakerExperience.toString(),
      'about_maker' : AboutMakerController.value.text,
      'expect_from_seeker' : ExpectFromSeekerController.value.text,
      'heading_of_maker' : HandlingOfMakerController.value.text,
      'type' : '2',
    };
    print(data);
    _api.MakerProfileApi(data).then((value){
      loading.value = false ;
      print(value);
      Utils.snackBar( "Message",value.msg.toString());
      Get.to(VerifyScreen());

    }).onError((error, stackTrace){
      print(error.toString());
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}