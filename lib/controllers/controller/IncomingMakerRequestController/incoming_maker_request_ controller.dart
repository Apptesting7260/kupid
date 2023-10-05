import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../models/IncomingMakerRequestModel/incoming_maker_request_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';
import 'package:get_storage/get_storage.dart'; // Import GetStorage

class IncomingMakerRequestController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final IncomingMakerValue = IncomingMakerRequestModel().obs;
  RxString error = ''.obs;

  final box = GetStorage(); // Create a GetStorage instance

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(IncomingMakerRequestModel value) =>
      IncomingMakerValue.value = value;
  void setError(String value) => error.value = value;

  void makerListApi() {
    // Check if cached data is available
    // if (box.hasData('incomingMakerRequestData')) {
    //   final cachedData = box.read('incomingMakerRequestData');
    //   setUserList(cachedData);
    //   setRxRequestStatus(Status.COMPLETED);
    // } else {
      setRxRequestStatus(Status.LOADING);
      _api.IncomingMakerRequestApi().then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setUserList(value);
        print(value);
         print("7293874988783b c7388398u9u9b32g 45 345345  35");
        // Cache the data for future use
        // box.write('incomingMakerRequestData', value);
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        print(error.toString());
        print("request error maker side 23459uyh87hjjghtagvygdygdygfugsfuygfggfsg233242424235432========");
      });
    }
  }
// }
