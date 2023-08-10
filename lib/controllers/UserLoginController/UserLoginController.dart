import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
import 'package:cupid_match/match_maker/Maker_TabView.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserLoginController extends GetxController {

  final _api = AuthRepository();

  final Email_Or_Phone_Controller = TextEditingController().obs ;
  final PasswordController = TextEditingController().obs ;
  
  // final passwordController = TextEditingController().obs ;

  RxBool loading = false.obs;

  void UserLoginapiHit()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
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
String Bearertoken=value.token.toString();
String Tokernid=value.tokenId.toString();
prefs.setString('BarearToken', Bearertoken);
prefs.setString('Tokernid', Tokernid);
print(prefs.getString('BarearToken'));
print(prefs.getString('Tokernid'));
      Utils.snackBar( "Message",value.message.toString());
      if(value.userType=="1"){
Get.offAll(Maker_TabView(index: 0,));
      }else{
        Get.offAll(Siker_Tab_View(index: 0,));
      }

   
    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}