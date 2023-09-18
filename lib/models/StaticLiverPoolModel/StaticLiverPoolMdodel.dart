// To parse this JSON data, do
//
//     final staticLiverPullModel = staticLiverPullModelFromJson(jsonString);

import 'dart:convert';

StaticLiverPullModel staticLiverPullModelFromJson(String str) => StaticLiverPullModel.fromJson(json.decode(str));

String staticLiverPullModelToJson(StaticLiverPullModel data) => json.encode(data.toJson());

class StaticLiverPullModel {
  String? status;
  List<Datum>? data;

  StaticLiverPullModel({
     this.status,
     this.data,
  });

  factory StaticLiverPullModel.fromJson(Map<String, dynamic> json) => StaticLiverPullModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  var  id;
  var name;
  var email;
  var phone;
  var occupation;
  var salary;
  var address;
  var height;
  var dob;
  var gender;
  var religion;
  var currentStep;
  var imgPath;
  var videoPath;
  var occupationName;
  var likeStatus;
  SpinLeverpoolRequestedData? spinLeverpoolRequestedData;

  Datum({
     this.id,
     this.name,
     this.email,
     this.phone,
     this.occupation,
     this.salary,
     this.address,
     this.height,
     this.dob,
     this.gender,
     this.religion,
     this.currentStep,
     this.imgPath,
     this.videoPath,
     this.occupationName,
     this.likeStatus,
     this.spinLeverpoolRequestedData,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    occupation: json["occupation"],
    salary: json["salary"],
    address: json["address"],
    height: json["height"],
    dob: json["dob"],
    gender: json["gender"],
    religion: json["religion"],
    currentStep: json["current_step"],
    imgPath: json["img_path"],
    videoPath: json["video_path"],
    occupationName: json["occupation_name"],
    likeStatus: json["like_status"],
    spinLeverpoolRequestedData: SpinLeverpoolRequestedData.fromJson(json["spin_leverpool_requested_data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "occupation": occupation,
    "salary": salary,
    "address": address,
    "height": height,
    "dob": dob,
    "gender": gender,
    "religion": religion,
    "current_step": currentStep,
    "img_path": imgPath,
    "video_path": videoPath,
    "occupation_name": occupationName,
    "like_status": likeStatus,
    "spin_leverpool_requested_data": spinLeverpoolRequestedData!.toJson(),
  };
}

class SpinLeverpoolRequestedData {
  var id;
  var seekerId;
  var leverpoolRequestTime;
  var showExpireTime;
  List<SpinRequestDatum>? spinRequestData;

  SpinLeverpoolRequestedData({
     this.id,
     this.seekerId,
     this.leverpoolRequestTime,
     this.showExpireTime,
     this.spinRequestData,
  });

  factory SpinLeverpoolRequestedData.fromJson(Map<String, dynamic> json) => SpinLeverpoolRequestedData(
    id: json["id"],
    seekerId: json["seeker_id"],
    leverpoolRequestTime: json["leverpool_request_time"],
    showExpireTime: json["show_expire_Time"],
    spinRequestData: List<SpinRequestDatum>.from(json["spin_request_data"].map((x) => SpinRequestDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seeker_id": seekerId,
    "leverpool_request_time": leverpoolRequestTime,
    "show_expire_Time": showExpireTime,
    "spin_request_data": List<dynamic>.from(spinRequestData!.map((x) => x.toJson())),
  };
}

class SpinRequestDatum {
  SeekerData? seekerData;
  bool? isRequested;

  SpinRequestDatum({
     this.seekerData,
     this.isRequested,
  });

  factory SpinRequestDatum.fromJson(Map<String, dynamic> json) => SpinRequestDatum(
    seekerData: SeekerData.fromJson(json["seeker_data"]),
    isRequested: json["is_requested"],
  );

  Map<String, dynamic> toJson() => {
    "seeker_data": seekerData!.toJson(),
    "is_requested": isRequested,
  };
}

class SeekerData {
  var id;
  var name;
  var email;
  var phone;
  var occupation;
  var salary;
  var address;
  var height;
  var dob;
  var gender;
  var religion;
  var currentStep;
  var imgPath;
  var videoPath;
  var occupationName;
  var likeStatus;
  Questions? questions;

  SeekerData({
     this.id,
     this.name,
     this.email,
     this.phone,
     this.occupation,
     this.salary,
     this.address,
     this.height,
     this.dob,
     this.gender,
     this.religion,
     this.currentStep,
     this.imgPath,
     this.videoPath,
     this.occupationName,
     this.likeStatus,
     this.questions,
  });

  factory SeekerData.fromJson(Map<String, dynamic> json) => SeekerData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    occupation: json["occupation"],
    salary: json["salary"],
    address: json["address"],
    height: json["height"],
    dob: json["dob"],
    gender: json["gender"],
    religion: json["religion"],
    currentStep: json["current_step"],
    imgPath: json["img_path"],
    videoPath: json["video_path"],
    occupationName: json["occupation_name"],
    likeStatus: json["like_status"],
    questions: Questions.fromJson(json["questions"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "occupation": occupation,
    "salary": salary,
    "address": address,
    "height": height,
    "dob": dob,
    "gender": gender,
    "religion": religion,
    "current_step": currentStep,
    "img_path": imgPath,
    "video_path": videoPath,
    "occupation_name": occupationName,
    "like_status": likeStatus,
    "questions": questions!.toJson(),
  };
}

class Questions {
  var id;
  var seekerId;
  var question;
  var firstAnswer;
  var secondAnswer;
  var thirdAnswer;
  var correctAnswer;
  var status;
  var createdAt;
  var updatedAt;

  Questions({
     this.id,
     this.seekerId,
     this.question,
     this.firstAnswer,
     this.secondAnswer,
     this.thirdAnswer,
     this.correctAnswer,
     this.status,
     this.createdAt,
     this.updatedAt,
  });

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
    id: json["id"],
    seekerId: json["seeker_id"],
    question: json["question"],
    firstAnswer: json["first_answer"],
    secondAnswer: json["second_answer"],
    thirdAnswer: json["third_answer"],
    correctAnswer: json["correct_answer"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seeker_id": seekerId,
    "question": question,
    "first_answer": firstAnswer,
    "second_answer": secondAnswer,
    "third_answer": thirdAnswer,
    "correct_answer": correctAnswer,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
