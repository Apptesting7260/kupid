import 'package:cupid_match/models/OutgoingRequestModel/OutgoingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';

import '../../../repository/Auth_Repository/Auth_Repository.dart';

class OutgoinRequestController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final OutgoingRequestvalue =OutgoingRequestModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setUserList(OutgoingRequestModel value) => OutgoingRequestvalue.value = value ;
  void setError(String value) => error.value = value ;


  void seekerListApi(){
    setRxRequestStatus(Status.LOADING);

    _api.OutgoinRequestApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
  //
  // void refreshApi(){
  //
  //     setRxRequestStatus(Status.LOADING);
  //
  //   _api.userListApi().then((value){
  //     setRxRequestStatus(Status.COMPLETED);
  //     setUserList(value);
  //   }).onError((error, stackTrace){
  //     setError(error.toString());
  //     setRxRequestStatus(Status.ERROR);
  //
  //   });
  // }
}