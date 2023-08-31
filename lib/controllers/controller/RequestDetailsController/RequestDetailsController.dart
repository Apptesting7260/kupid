


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ViewSikerProfileDetailsControllerinstance=Get.put(ViewSikerProfileDetailsController
());
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

    _api.RequestDetailsApi(data).then((value)async{
      setRxRequestStatus(Status.COMPLETED);
      ViewProfileDetails(value);
      print(value);
print(ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString());

   await _firestore.collection("seeker").doc(ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString()).collection("Request").doc(value.data!.id.toString()).set({
    "getseeker":value.data!.getseeker!.id.toString(),
    "getmaker":value.data!.getmaker!.id.toString(),
    "getanotherseeker":value.data!.getanotherseeker!.id.toString(),
    "requestid":value.data!.id.toString()
   });

  await _firestore.collection("RoomId's").doc(value.data!.roomId.toString()).set({});


         print("fjksdfn");
    }).onError((error, stackTrace){
      setError(error.toString());
      print(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  
}