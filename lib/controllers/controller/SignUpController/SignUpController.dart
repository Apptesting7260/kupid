import 'dart:async';

import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

String? sigupcredencial;
class SignUpController extends GetxController {

  final _api = AuthRepository();

  final credentialsController = TextEditingController().obs ;
  
  // final passwordController = TextEditingController().obs ;

  RxBool loading = false.obs;

  void SignUpapiHit(){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : credentialsController.value.text,
      
    };
    print(data);
    _api.SignUpApi(data).then((value){
      loading.value = false ;
print(value);

      // Utils.snackBar( "Message",value.msg.toString());

   Timer(Duration(seconds: 2),(){
   if(value.msg!="User Already Exist") {
    sigupcredencial=credentialsController.value.text;
Get.to(() => PinFields(
       pinPutFocusNode: FocusNode(),

       // key: _formKey,
       formKey: Key(" "),

     ));
   } 
   }) ;
    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}