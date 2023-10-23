import 'dart:async';
import 'dart:convert';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/match_seeker/profile/update_profile_details.dart';
import 'package:http/http.dart' as http;
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GlobalVariable/GlobalVariable.dart';
import '../data/response/status.dart';
import 'controller/SetRoleController/SetRoleController.dart';

String? Finalcredencial;

class UserEmailAndPhoneVerifyController extends GetxController {
  final _api = AuthRepository();

  final emailAndPhoneVerifyController = TextEditingController().obs;
  final SignUpControllerinstance = Get.put(SignUpController());
  final otpController = TextEditingController().obs;
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  final phone_verify = 0.obs;
  final email_verify = 0.obs;
  RxBool verified = false.obs;
  RxBool optsent = false.obs;

  RxBool loading = false.obs;
  Future<void> PhoneAndEmailVerifiyed() async {
    Map data = {};
    if (emailAndPhoneVerifyController.value.text.contains("@")) {
      data = {
        'email': emailAndPhoneVerifyController.value.text,
        'update_type': "email",
        "type": ProfileType.toString(),
        'phone': SignUpControllerinstance.credentialsController.value.text,
      };
    } else {
      data = {
        'phone': emailAndPhoneVerifyController.value.text,
        'update_type': "phone",
        "type": ProfileType.toString(),
        'email': SignUpControllerinstance.credentialsController.value.text,
      };
    }
    final prefs = await SharedPreferences.getInstance();

    print(emailAndPhoneVerifyController.value.text);
    // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)
    print(data);

    _api.UserPhoneAndNumberVerfyApi(data).then((value) async {
      rxRequestStatus(Status.COMPLETED);
      // ViewProfileDetails(value);
      print("======================================================$value");
      print(value.otp);
      optsent.value = true;
    }).onError((error, stackTrace) {
      print("${error.toString()}===============+++=");
      rxRequestStatus(Status.ERROR);
    });
  }

  Future<void> PhoneAndEmaiOtpVerifyed() async {
    Map data = {};
    if (emailAndPhoneVerifyController.value.text.contains("@")) {
      data = {
        'email': emailAndPhoneVerifyController.value.text,
        'otp': otpController.value.text,
        'email_otp_verified_status': "1",
        'update_type': "email_otp_verification",
        "type": ProfileType.toString()
      };
    } else {
      data = {
        'update_type': "phone_otp_verification",
        'phone': emailAndPhoneVerifyController.value.text,
        'otp': otpController.value.text,
        'phone_otp_verification_status': "1",
        "type": ProfileType.toString()
      };
    }
    print("==========$data");

    final prefs = await SharedPreferences.getInstance();
    loading.value = true;
    print(otpController.value.text);
    // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)

    otpController.value.clear();
    _api.UserPhoneAndNumberVerfyApi(data).then((value) async {
      loading.value = false;
      rxRequestStatus(Status.COMPLETED);
      // ViewProfileDetails(value);
      verified.value = true;
      print("======================================================$value");
      print(value.msg);

      print(
          "hit request  maker side hyfr jfjd api 5678900bbuhc 8u0u00-09-9-9-09-9-9-09-9jkcniuicjzijnnzijxn");
      loading.value = false;
      print("==========$data");

      Get.back();
      print("fjksdfn");
    }).onError((error, stackTrace) {
      rxRequestStatus(Status.COMPLETED);
      print("==========$data");
      otpController.value.clear();
      loading.value = false;
      print("${error.toString()}===============+++=");
      rxRequestStatus(Status.ERROR);
      Get.back();
    });
  }
}