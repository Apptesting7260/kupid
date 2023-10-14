


import 'dart:convert';

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


  Future<dynamic> ViewRequestDetailsApiHit()async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data={
"request_id":userIdsiker.toString()
    };
   setRxRequestStatus(Status.LOADING);

    _api.RequestDetailsApi(data).then((value)async {
      setRxRequestStatus(Status.COMPLETED);
      ViewProfileDetails(value);
      // print(value);
      Map <String, dynamic> roomdetails = {};
      if (value.data!.matchWith.toString() != "null") {
        roomdetails = {
          "seeker_name1": value.data!.getseeker!.name.toString(),
          "seeker_name2": value.data!.getanotherseeker!.name.toString(),

          "seeker_id1": value.data!.getanotherseeker!.id.toString(),

          "seeker_id2": value.data!.getanotherseeker!.id.toString(),
          "maker_id": value.data!.getmaker!.id.toString(),
          "maker_name": value.data!.getmaker!.name.toString(),
          "maker_image": value.data!.getmaker!.imgPath.toString(),
          "seeker_inage1": value.data!.getseeker!.imgPath.toString(),
          "seeker_inage2": value.data!.getanotherseeker!.imgPath.toString(),
          "roomname": value.data!.getseeker!.name.toString() +
              value.data!.getanotherseeker!.name.toString() +
              value.data!.getmaker!.name.toString()
        };
      }

       await _firestore.collection(value.data!.getseeker!.name.toString(),).doc(value.data!.roomid.toString()).set(roomdetails);
       // print("hit request api 5678900bbuhc 8u0u00-09-9-9-09-9-9-09-9jkcniuicjzijnnzijxn");
// print(ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString());

       //  await _firestore.collection("seeker").doc(ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString()).collection("Request").doc(value.data!.id.toString()).set({
       //   "getseeker":value.data!.getseeker!.id.toString(),
       //   "getmaker":value.data!.getmaker==null?"": value.data!.getmaker!.id.toString(),
       //   "getanotherseeker":value.data!.getanotherseeker!.id.toString(),
       //   "requestid":value.data!.id.toString()
       //  });
       // await _firestore.collection("RoomId's").doc(value.data!.roomid.toString()).set({});S

//  if(value.data!.roomid==null) {


//  }else{
//   print("");

//   }


       print("fjksdfn");
     }
    ).onError((error, stackTrace){
      setError(error.toString());
      print("${error.toString()}===============+++=");
      setRxRequestStatus(Status.ERROR);

    });
  }

  
}