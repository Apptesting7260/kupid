
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/models/DoMachesModel.dart/DoMatchesModel.dart';
import 'package:cupid_match/models/ProfileScrollModel/ProfileScrollModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';

class DoMatchesController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final DoMatches =DomatchesModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void DoMatchesrequest(DomatchesModel _value) => DoMatches.value = _value ;
  void setError(String _value) => error.value = _value ;


  void DoMatchesApiHit(){
   setRxRequestStatus(Status.LOADING);
   Map Data={
"match_type":"1",
"match_from":match_fromid,
"match_with":match_withid,
"maker_id":""
   };

    _api.DoMatcchesapi(Data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      DoMatchesrequest(value);
      print(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      print("error");
      print(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  // void refreshApi(){

  //     setRxRequestStatus(Status.LOADING);

  //   _api.userListApi().then((value){
  //     setRxRequestStatus(Status.COMPLETED);
  //     setUserList(value);
  //   }).onError((error, stackTrace){
  //     setError(error.toString());
  //     setRxRequestStatus(Status.ERROR);

  //   });
  // }
}


