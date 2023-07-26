

import 'dart:ui';

import 'package:cupid_match/data/network/network_api_services.dart';
import 'package:cupid_match/models/OtpVerrificationModel/OtpverificationModel.dart';
import 'package:cupid_match/models/SignUpModel/SinUpModel.dart';
import 'package:cupid_match/res/app_url/app_url.dart';

import '../../models/CreatePasswordModel/CreatePasswordModel.dart';
import '../../models/ForgotPasswordModel/ForgotPasswordModel.dart';
import '../../models/ForgotPasswordResetModel/ForgotPasswordResetModel.dart';
import '../../models/MakerProfileModel/MakerProfileModel.dart';
import '../../models/ResendOtpModel/ResendOtpModel.dart';
import '../../models/SeekerProfileModel/SeekerProfileModel.dart';
import '../../models/SetRoleModel/SetRoleModel.dart';



class AuthRepository {
int?abcd;
  final _apiService  = NetworkApiServices() ;


  Future<SignUpModel> SignUpApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.SignUpUrl);
    return SignUpModel.fromJson(response) ;
  }


  Future<OtpVerificationModel> OtpVarificationApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.OtpvarificationUrl);
    return OtpVerificationModel.fromJson(response) ;
  }


Future<CreatePasswordModel> CreatePasswordApi(var data) async{
  dynamic response = await _apiService.postApi(data, AppUrl.CreatePasswordUrl);
  return CreatePasswordModel.fromJson(response) ;
}

Future<ResendOtpModel> ResendOtpApi(var data) async{
  dynamic response = await _apiService.postApi(data, AppUrl.ResendOtpUrl);
  return ResendOtpModel.fromJson(response) ;
}

Future<SetRoleModel> SetRoleApiApi(var data) async{
  dynamic response = await _apiService.postApi(data, AppUrl.SetRoleUrl);
  return SetRoleModel.fromJson(response) ;
}

Future<ForgotPasswordModel> ForgotPasswordApi(var data) async{
  dynamic response = await _apiService.postApi(data, AppUrl.ForgotPasswordUrl);
  return ForgotPasswordModel.fromJson(response) ;
}

Future<ForgotPasswordResetModel> ForgotPasswordResetApi(var data) async{
  dynamic response = await _apiService.postApi(data, AppUrl.ForgotPasswordResetUrl);
  return ForgotPasswordResetModel.fromJson(response) ;
}

Future<MakerProfileModel> MakerProfileApi(var data) async{
  dynamic response = await _apiService.postApi2(data, "https://urlsdemo.xyz/kupid/api/user-profile-update");
  print(response);
  return MakerProfileModel.fromJson(response) ;
}

Future<SeekerProfileModel> SeekerProfileApi(var data) async{
  dynamic response = await _apiService.postApi2(data, AppUrl.SeekerProfileUrl);
  print(response);
  return SeekerProfileModel.fromJson(response) ;
}


}