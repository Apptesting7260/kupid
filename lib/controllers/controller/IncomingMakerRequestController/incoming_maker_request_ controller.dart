import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';

import '../../../models/IncomingMakerRequestModel/incoming_maker_request_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';

class IncomingMakerRequestController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final IncomingMakerValue =IncomingMakerRequestModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setUserList(IncomingMakerRequestModel value) => IncomingMakerValue.value = value ;
  void setError(String value) => error.value = value ;


  void makerListApi(){
    setRxRequestStatus(Status.LOADING);

    _api.IncomingMakerRequestApi().then((value){
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