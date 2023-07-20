import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class OtpVarificationController extends GetxController {
final SignUpControllerinstance=Get.put(SignUpController());
  final _api = AuthRepository();

  final OtpController = TextEditingController().obs ;

  RxBool loading = false.obs;

  void OtpVerificationapiiHit(){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : SignUpControllerinstance.credentialsController.value.text,
      'otp' : OtpController.value.text,
    };
    print(data);
    _api.OtpVarificationApi(data).then((value){
      loading.value = false ;
print(value);
      Utils.snackBar( "Message",value.msg.toString());
  Get.to(() => CreatePassword());

    
    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}