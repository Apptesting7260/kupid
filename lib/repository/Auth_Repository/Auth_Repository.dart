

import 'dart:ui';

import 'package:cupid_match/data/network/network_api_services.dart';
import 'package:cupid_match/models/OtpVerrificationModel/OtpverificationModel.dart';
import 'package:cupid_match/models/SignUpModel/SinUpModel.dart';
import 'package:cupid_match/res/app_url/app_url.dart';



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


}