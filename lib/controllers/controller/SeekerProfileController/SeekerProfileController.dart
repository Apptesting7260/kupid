// import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
// import 'package:cupid_match/utils/utils.dart';
// import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
// import 'package:cupid_match/views/sign_up/choose_profile.dart';
// import 'package:cupid_match/views/sign_up/create_password.dart';
// import 'package:cupid_match/views/user/otp.dart';
// import 'package:cupid_match/views/user/reset_password.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// import '../../../GlobalVariable/GlobalVariable.dart';
// import '../../../match_maker/verify_identity.dart';
// import '../../../match_seeker/photos.dart';
// import '../../../views/user/verification.dart';
// import '../ForgotPasswordController/ForgotPasswordController.dart';
// import '../OtpVarificationController/OtpVarificationController.dart';


// class SeekerProfileController extends GetxController {

//   final _api = AuthRepository();

//   RxBool loading = false.obs;

//   final UpdateTypeController = TextEditingController().obs;
//   final NameController = TextEditingController().obs;
//   final EmailController = TextEditingController().obs;
//   final PhoneController = TextEditingController().obs;
//   final TypeController = TextEditingController().obs;
//   // final OccupationController = TextEditingController().obs;
//   final AddressController = TextEditingController().obs;
//   final HeightController = TextEditingController().obs;
//   final QuestionController = TextEditingController().obs;
//   final FirstanswerController = TextEditingController().obs;
//   final SecondanswerController = TextEditingController().obs;
//   final ThirdanswerController = TextEditingController().obs;
//   // final CorrectanswerController = TextEditingController().obs;

//   void SeekerProfileApiHit(){
//     loading.value = true ;
//     print(loading.value);
//     Map data = {
//       'update_type' : "profile",
//       'name' : NameController.value.text,
//       'email' : EmailController.value.text,
//       'phone' : PhoneController.value.text,
//       // 'dob' : datestring.toString(),
//       // 'gender' :SelectedGender.toString(),
//       'type' : '2',
//      // 'occupation' : Selectedoccupation.toString(),
//       'address' : AddressController.value.text,
//       'height' : HeightController.value.text,
//       'dob' : datestring.toString(),
//       'question' : QuestionController.value.text,
//       'first_answer' : FirstanswerController.value.text,
//       'second_answer' : SecondanswerController.value.text,
//       'third_answer' : ThirdanswerController.value.text,
//       'correct_answer' : "25",
//     };
//     print(data);
//     _api.SeekerProfileApi(data).then((value){
//       loading.value = false ;
//       print(value);
//       Utils.snackBar( "Message",value.msg.toString());
//       Get.to(PhotosScreen());

//     }).onError((error, stackTrace){
//       print(error.toString());
//       loading.value = false ;
//       Utils.snackBar('Error', error.toString());
//     });
//   }
// }