


import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/models/RequestModel/RequestModel.dart';
import 'package:cupid_match/models/ViewMakerProfileDetailsModel/ViewMakerProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewProfileDetailsModel/ViewProfileDetailsModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewRequestDetailsController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final ViewProfileDetail =RequestDetailsModel().obs ;
  RxString error = ''.obs;
  



  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void ViewProfileDetails(RequestDetailsModel _value) => ViewProfileDetail.value = _value ;
  void setError(String _value) => error.value = _value ;


  void ViewRequestDetailsApiHit()async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data={
"request_id":requestid.toString()

    };
   setRxRequestStatus(Status.LOADING);

    _api.RequestDetailsApi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      ViewProfileDetails(value);
      print(value);

         print("fjksdfn");
    }).onError((error, stackTrace){
      setError(error.toString());
      print(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  
}