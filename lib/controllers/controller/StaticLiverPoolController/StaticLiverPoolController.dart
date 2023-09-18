
import 'dart:async';

import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/MagicProfile/MagicProfiles.dart';
import 'package:cupid_match/models/StaticLiverPoolModel/StaticLiverPoolMdodel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../GlobalVariable/GlobalVariable.dart';

class StaticLiverPullController extends GetxController {

  final _api = AuthRepository();

  RxString selectedAnswer="".obs;
  final rxRequestStatus = Status.LOADING.obs ;
  final staticLiverPullvalue =StaticLiverPullModel().obs ;
  RxString error = ''.obs;
  RxList<dynamic> slotImages = [].obs;
  RxList<dynamic> slotname = [].obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserProfileList(StaticLiverPullModel _value) => staticLiverPullvalue.value = _value ;
  void setError(String _value) => error.value = _value ;
  final box = GetStorage(); 
  RxInt remainingHours = 0.obs;
  RxInt remainingMinutes = 0.obs;
  RxInt remainingSeconds = 0.obs;
  late Timer _timer;
  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {

        _updateRemainingTime();

    });
  }
  void _updateRemainingTime() {
    if (startTime == null || endTime == null) {
      return; // Handle if data is not available yet
    }

    Duration elapsedDuration = DateTime.now().difference(startTime!);
    Duration totalDuration = endTime!.difference(startTime!);

    if (elapsedDuration.isNegative) {
      return; // Handle if the start time is in the future
    }

    if (elapsedDuration >= totalDuration) {
      return; // Handle if the end time has passed
    }

    Duration remainingDuration = totalDuration - elapsedDuration;

    remainingHours.value = remainingDuration.inHours;
    remainingMinutes.value = (remainingDuration.inMinutes % 60);
    remainingSeconds.value = (remainingDuration.inSeconds % 60);
  
  }

  void staticLiverPullmethod(){
    //  setRxRequestStatus(Status.LOADING);
 if (box.hasData('StaticLiverPulledData')) {
    // Use cached data if available
    final cachedData = box.read('StaticLiverPulledData');
    setUserProfileList(StaticLiverPullModel.fromJson(cachedData));
    setRxRequestStatus(Status.COMPLETED);
  } else{
    _api.StaticLiverPullApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserProfileList(value);
      print("object====");
      // for(int i=0; i<value.requests!.length; i++){
      //   slotImages.add(value.requests![i].imgPath.toString());
      //   slotname.add(value.requests![i].name.toString());
      // }

      startTime = DateTime.parse("${value.data![0].spinLeverpoolRequestedData!.leverpoolRequestTime.toString()}");
      endTime = DateTime.parse("${value.data![0].spinLeverpoolRequestedData!.showExpireTime.toString()}");
      for(int i=0; i<value.data!.length; i++){
        slotImages.add(value.data![i].imgPath.toString());
        slotname.add(value.data![i].name.toString());
      }
      print("object");
      print("$slotImages===================");
       final jsonData = value.toJson(); // Assuming you have a method toMap() in your model
      box.write('StaticLiverPulledData', jsonData);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
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