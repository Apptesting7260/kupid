import 'package:cupid_match/match_seeker/tab_screen.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserLoginController extends GetxController {

  final _api = AuthRepository();

  final Email_Or_Phone_Controller = TextEditingController().obs ;
  final PasswordController = TextEditingController().obs ;
  
  // final passwordController = TextEditingController().obs ;

  RxBool loading = false.obs;

  void UserLoginapiHit(){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : Email_Or_Phone_Controller.value.text,
      'password' : PasswordController.value.text,
      
    };
    print(data);
    _api.UserLoginapi(data).then((value){
      loading.value = false ;
print(value);
      Utils.snackBar( "Message",value.message.toString());
Get.off(TabScreen(index: 0,));
   
    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}