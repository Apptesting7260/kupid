import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/controllers/controller/FetchSubcriptionController/FetchSubcriptionController.dart';
import 'package:cupid_match/controllers/controller/ForgotPasswordController/ForgotPasswordController.dart';
import 'package:cupid_match/match_maker/Monthly_subscription_plans.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class CreateMontlyController extends GetxController {

///siker to siker chat /////////////////////////////////////////////////
Future<void> createOneToOneChat(String userId1, String userId2) async {
  final chatRef = FirebaseFirestore.instance.collection('ChatRooms');
  await chatRef.add({
    'participants': [userId1, userId2],
  });
}

///////////////siker to maker chat (group chat)///////////////////////
Future<void> createGroup(String groupName, List<String> participants) async {
  final groupRef = FirebaseFirestore.instance.collection('ChatRooms');
  await groupRef.add({
    'name': groupName,
    'participants': participants,
  });
}

}