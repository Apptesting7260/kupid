import 'package:cupid_match/match_maker/addbio_maker.dart';
import 'package:cupid_match/match_seeker/profile/profile_screen.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
String ?BarrierToken;
int ProfileType=1;
class SetRoleController extends GetxController {
  final SignUpControllerinstance=Get.put(SignUpController());
  final _api = AuthRepository();

  RxBool loading = false.obs;

  void SetRoleapiiHit(){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : SignUpControllerinstance.credentialsController.value.text,
      'type' : ProfileType.toString()
    };
    print(data);
    _api.SetRoleApiApi(data).then((value){
      loading.value = false ;
      print(value);
      BarrierToken =value.token;
      print(
          BarrierToken
      );
      Utils.snackBar( "Message",value.msg.toString());
      ProfileType != 1
          ? Get.to(() => ProfileOneScreen())
          : Get.to(() => ProfileScreen());

    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}