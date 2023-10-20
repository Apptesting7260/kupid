import 'dart:async';
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


class UserEmailAndPhoneVerifyController extends GetxController {

  final _api = AuthRepository();

  final emailAndPhoneVerifyController = TextEditingController().obs ;
  final otpController = TextEditingController().obs ;
  final rxRequestStatus = Status.LOADING.obs ;
  RxString error = ''.obs;
  final phone_verify=0.obs;
  final email_verify=0.obs;




  RxBool loading = false.obs;
  Future<void> PhoneAndEmailVerifiyed() async {
    Map data = {};
    if(emailAndPhoneVerifyController.value.text.contains("@")){
    data= { 'email' : emailAndPhoneVerifyController.value.text  ,
    'update_type' : "email",
    };
    }
    else{
    data= { 'phone' : emailAndPhoneVerifyController.value.text,
    'update_type' : "phone",
    };
    }
    final prefs=await SharedPreferences.getInstance();

    print(emailAndPhoneVerifyController.value.text);
    // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)


    _api.UserPhoneAndNumberVerfyApi(data).then((value)async{
      rxRequestStatus(Status.COMPLETED);
      // ViewProfileDetails(value);
      print("======================================================$value");
      print(value.otp);

      print("hit request  maker side hyfr jfjd api 5678900bbuhc 8u0u00-09-9-9-09-9-9-09-9jkcniuicjzijnnzijxn");
      // print(MakerSingleRequestController.ViewProfileDetail.value.profileDetails![0].id.toString());

      // await _firestore.collection("seeker").doc(ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString()).collection("Request").doc(value.data!.id.toString()).set({
      //   "getseeker":value.data!.getseeker!.id.toString(),
      //   "getmaker":value.data!.getmaker==null?"": value.data!.getmaker!.id.toString(),
      //   "getanotherseeker":value.data!.getanotherseeker!.id.toString(),
      //   "requestid":value.data!.id.toString()
      // });
      //
      // if(value.data!.roomid==null) {
      //
      //
      // }else{
      //   await _firestore.collection("RoomId's").doc(value.data!.roomid.toString()).set({});
      // }


      print("fjksdfn");
    }).onError((error, stackTrace){
      print("${error.toString()}===============+++=");
      rxRequestStatus(Status.ERROR);

    });
  }

  Future<void> PhoneAndEmaiOtpVerifyed() async {
    Map data = {};
    if(emailAndPhoneVerifyController.value.text.contains("@")){
     data={
       'email' : emailAndPhoneVerifyController.value.text,
        'otp': otpController.value.text,
    'email_otp_verification' : phone_verify.value.toString(),
       'update_type' : "email_otp_verification",
  };
    }
    else{
     data={
       'phone' : emailAndPhoneVerifyController.value.text,
        'otp': otpController.value.text,
    'phone_otp_verification' : phone_verify.value.toString(),
       'update_type' : "phone_otp_verification",
     };}
    final prefs=await SharedPreferences.getInstance();
    loading.value = true ;
    print(otpController.value.text);
    // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)


    _api.UserPhoneAndNumberVerfyApi(data).then((value)async{
      rxRequestStatus(Status.COMPLETED);
      // ViewProfileDetails(value);
      print("======================================================$value");
      print(value.msg);

      print("hit request  maker side hyfr jfjd api 5678900bbuhc 8u0u00-09-9-9-09-9-9-09-9jkcniuicjzijnnzijxn");
     loading.value=false;


      print("fjksdfn");
    }).onError((error, stackTrace){
      print("${error.toString()}===============+++=");
      rxRequestStatus(Status.ERROR);


    });
  }



}
