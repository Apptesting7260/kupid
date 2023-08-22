import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';

import '../../../repository/Auth_Repository/Auth_Repository.dart';

class IncomingRequestController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final IncomingRequestvalue =IncomingRequestModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setUserList(IncomingRequestModel value) => IncomingRequestvalue.value = value ;
  void setError(String value) => error.value = value ;


  void iseekerListApi(){
    setRxRequestStatus(Status.LOADING);

    _api.IncomingRequestApi().then((value){
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