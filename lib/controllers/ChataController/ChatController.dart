// import 'dart:async';
// import 'dart:io';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cupid_match/controllers/controller/FetchSubcriptionController/FetchSubcriptionController.dart';
// import 'package:cupid_match/controllers/controller/ForgotPasswordController/ForgotPasswordController.dart';
// import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
// import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
// import 'package:cupid_match/match_maker/Monthly_subscription_plans.dart';
// import 'package:cupid_match/match_seeker/chat_screen.dart';
// import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
// import 'package:cupid_match/utils/utils.dart';
// import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
// import 'package:cupid_match/views/sign_up/create_password.dart';
// import 'package:cupid_match/views/user/otp.dart';
// import 'package:cupid_match/views/user/reset_password.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';


// class CreateMontlyController extends GetxController {


//   int maxduration = 100;
//   int currentpos = 0;
//   String currentpostlabel = "00:00";
//   String audioasset = "assets/audio/red-indian-music.mp3";
//   bool isplaying = false;
//   bool audioplayed = false;
//   late Uint8List audiobytes;
// Recording ?recording;
//   AudioPlayer player = AudioPlayer();
//    Map<String, dynamic>? messages ;
//   TextEditingController messagecontroller = TextEditingController();


//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final ViewRequestDetailsControllerinstance=Get.put(ViewRequestDetailsController());
  
//   final ViewSikerProfileDetailsControllernstance=Get.put(ViewSikerProfileDetailsController());
//    String formatTimestamp(Timestamp timestamp) {
//     final DateTime dateTime = timestamp.toDate();
//     final DateFormat formatter = DateFormat('h:mm a');
//     return formatter.format(dateTime);
//   }
//  FocusNode messageFocusNode = FocusNode();
// void updatetryeDataInFirestore() async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
// print(("hited"));
//   // Replace 'users' with your collection name and 'documentId' with the specific document ID
//   DocumentReference docRef =  firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("typestatus").doc("userstypingstatus");

//    Map<String, dynamic> typestatus = {
//         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "status":true,
        
//       };

//   await docRef.update(typestatus);
// }

// void updatefalseDataInFirestore() async {
//    FirebaseFirestore firestore = FirebaseFirestore.instance;
// print(("hited"));
//   // Replace 'users' with your collection name and 'documentId' with the specific document ID
//   DocumentReference docRef =  firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("typestatus").doc("userstypingstatus");

//    Map<String, dynamic> typestatus = {
//         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "status":false,
        
//       };

//   await docRef.update(typestatus);
// }
//     void _onFocusChange() {
//     if (messageFocusNode.hasFocus) {
//       updatetryeDataInFirestore();
//       print("TextField is active: true");
//     } else {
//       updatefalseDataInFirestore();
//       print("TextField is active: false");
//     }
//   }

//  void typeingstatusofuser()async{
//     print("hited");
//      Map<String, dynamic> typestatus = {
//         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "status":false,
        
//       };

//       await _firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("typestatus").doc("userstypingstatus").set(typestatus);
// }

// @override
//   void initState() {
   
//       messageFocusNode.addListener(_onFocusChange);
     
//                 ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
// ViewRequestDetailsControllerinstance.ViewRequestDetailsApiHit();
//   _initAudioRecorder();// TODO: implement initState

  
//     super.initState();
//   }
//   final ViewSikerProfileDetailsControllerinstance=Get.put(ViewSikerProfileDetailsController
// ());
//  final ScrollController _scrollController = ScrollController();


// void onSendMessage()async {
//   switch (messagetype) {
//     case "text":
//       Map<String, dynamic> messages = {
//         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "message": messagecontroller.text,
//         "type": "text",
//         "time": FieldValue.serverTimestamp(),
//       };
//         messagecontroller.clear();
//     await _firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("massages").add(messages);
//       print("Enter Some Text");
//       setState(() {
//         messagetype="text";
//         print(messagetype);
//       });
//       // Add your logic for handling text messages here
//       break;
//     case "img":
//     messages = {
//         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "message": messagecontroller.text,
//         "imageurl":messageimgurl,
//         "type": "img",
//         "time": FieldValue.serverTimestamp(),
//       };
//         messagecontroller.clear();
//     await _firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("massages").add(messages!);
//       print("Enter Some Text");
//        setState(() {
//         messagetype="text";
//         print(messagetype);
//       });
//       // Add your logic for handling image messages here
//       break;
//     case "audio":
//      messages = {
//         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "message": messagecontroller.text,
//         "audiourl":messagaudiourl,
        
//         "type": "audio",
//         "time": FieldValue.serverTimestamp(),
//       };
//        await _firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("massages").add(messages!);
//       print("Enter Some Text");
//        setState(() {
//         messagetype="text";
//         print(messagetype);
//       });
//       break;
//     case "video":
//       print("Video");
//        messages = {
//         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "message": messagecontroller.text,
//         "videourl":messagvideoourl,
        
//         "type": "video",
//         "time": FieldValue.serverTimestamp(),
//       };
//        await _firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("massages").add(messages!);
//       print("Enter Some Text");
//        setState(() {
//         messagetype="text";
//         print(messagetype);
//       });
//       // Add your logic for handling video messages here
//       break;
//     default:
//       print("Unknown message type");
//       // Handle the case where the message type is unknown
//   }
// }


//  String customPath = '/flutter_audio_recorder_';
// Future<String> uploadSelectedImageAndGetUrl() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.getImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     try {
//       // Create a reference to the Firebase Storage location where you want to store the image.
//       final Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');

//       // Upload the selected image to Firebase Storage
//       final UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));

//       // Await the completion of the upload
//       final TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);

//       // Retrieve the download URL for the uploaded image
//       final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
// print(downloadUrl);

// setState(() {
//   messageimgurl=downloadUrl;
//   messagetype="img";
// });
// onSendMessage();
//       return downloadUrl;

      
//     } catch (error) {
//       // Handle any errors that occur during the upload process
//       print('Error uploading image: $error');
//       return "null";
//     }
//   } else {
//     // User canceled the image selection
//     return "null";
//   }
// }
//  late FlutterAudioRecorder2 _audioRecorder;
//   bool _isRecording = false;
//   String? _recordingPath;
//   late Timer _recordingTimer;
//   bool isRecordingAudio = false;
//   String messagetype = "";
//   String messagaudiourl = "";


//   Future<void> _initAudioRecorder() async {
//     final appDocumentsDirectory = await getApplicationDocumentsDirectory();
//     final uniqueFileName = DateTime.now().toIso8601String();

//     final recorder = FlutterAudioRecorder2(
//       '${appDocumentsDirectory.path}/$uniqueFileName',
//       audioFormat: AudioFormat.WAV,
//     );

//     await recorder.initialized;
//     setState(() {
//       _audioRecorder = recorder;
//     });
//   }

//   Future<void> _startRecording() async {
//     try {
//       final appDocumentsDirectory = await getApplicationDocumentsDirectory();
//       final uniqueFileName = DateTime.now().toIso8601String();

//       final recorder = FlutterAudioRecorder2(
//         '${appDocumentsDirectory.path}/$uniqueFileName',
//         audioFormat: AudioFormat.WAV,
//       );

//       await recorder.initialized;
//       await recorder.start();

//       setState(() {
//         _audioRecorder = recorder;
//         _isRecording = true;
//         isRecordingAudio = true;
//         print("Recording started");
//       });

//       _recordingTimer = Timer(Duration(seconds: 60), () {
//         _stopRecording();
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> _stopRecording() async {
//     try {
//       if (_recordingTimer.isActive) {
//         _recordingTimer.cancel();
//       }

//       final recording = await _audioRecorder.stop();

//       setState(() {
//         _isRecording = false;
//         _recordingPath = recording!.path;
//         isRecordingAudio = false;
//       });

//       if (_recordingPath != null) {
//         await _uploadAudioToFirebase(File(_recordingPath!));

//         setState(() {
//           _recordingPath = null;
//           print(_recordingPath);
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> _uploadAudioToFirebase(File audioFile) async {
//     if (audioFile.existsSync()) {
//       try {
//         final storage = FirebaseStorage.instance;
//         final fileName = audioFile.path.split('/').last;
//         final Reference reference = storage.ref().child('audio_recordings/$fileName');

//         final UploadTask uploadTask = reference.putFile(audioFile);

//         final TaskSnapshot storageTaskSnapshot = await uploadTask;
//         final String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();
//         setState(() {
//           messagetype = "audio";
//           messagaudiourl = downloadURL;
//         });
//            onSendMessage();

//         print('File uploaded successfully. Download URL: $downloadURL');
//       } catch (error) {
//         print('Error uploading file: $error');
//       }
//     } else {
//       print('File does not exist: ${audioFile.path}');
//     }
//   }
// Future<String?> uploadVideoToFirebaseStorage(String filePath) async {
//   try {
//     Reference storageReference = FirebaseStorage.instance.ref().child('videos/${DateTime.now()}.mp4');
//     final UploadTask uploadTask = storageReference.putFile(File(filePath));

//     final TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));

//     final String url = await downloadUrl.ref.getDownloadURL();
//     print(url);
//       setState(() {
//         messagetype = "video";
//         messagvideoourl = url;
//       });
//          onSendMessage();
//     return url;
    
//   } catch (e) {
//     print('Error uploading video: $e');
//     return null;
//   }
// }

// Future<void> pickVideoAndUploadToFirebase(BuildContext context) async {
//   try {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//       // Remove the allowedExtensions parameter
//     );

//     if (result != null) {
//       PlatformFile file = result.files.first;
//       String filePath = file.path.toString();

//       String? videoUrl = await uploadVideoToFirebaseStorage(filePath);

//       if (videoUrl != null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Video uploaded to Firebase: $videoUrl'),
//         ));
//       }
//     }
//   } catch (e) {
//     print('Error picking and uploading video: $e');
//   }
// }


// }