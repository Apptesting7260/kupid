// To parse this JSON data, do
//
//     final makerRecentMatchesModel = makerRecentMatchesModelFromJson(jsonString);

import 'dart:convert';

MakerRecentMatchesModel makerRecentMatchesModelFromJson(String str) => MakerRecentMatchesModel.fromJson(json.decode(str));

String makerRecentMatchesModelToJson(MakerRecentMatchesModel data) => json.encode(data.toJson());

class MakerRecentMatchesModel {
  String ?status;
  List<Request>? requests;

  MakerRecentMatchesModel({
     this.status,
     this.requests,
  });

  factory MakerRecentMatchesModel.fromJson(Map<String, dynamic> json) => MakerRecentMatchesModel(
    status: json["status"],
    requests: List<Request>.from(json["requests"].map((x) => Request.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "requests": List<dynamic>.from(requests!.map((x) => x.toJson())),
  };
}

class Request {
  int id;
  int makerId;
  int matchFrom;
  int matchWith;
  int matchType;
  String matchWithStatus;
  String? matchFromStatus;
  int status;
  int? roomid;
  String createdAt;
  String updatedAt;
  Getmaker getmaker;
  Getseeker getseeker;
  Getanotherseeker getanotherseeker;

  Request({
    required this.id,
    required this.makerId,
    required this.matchFrom,
    required this.matchWith,
    required this.matchType,
    required this.matchWithStatus,
    required this.matchFromStatus,
    required this.status,
    required this.roomid,
    required this.createdAt,
    required this.updatedAt,
    required this.getmaker,
    required this.getseeker,
    required this.getanotherseeker,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    id: json["id"],
    makerId: json["maker_id"],
    matchFrom: json["match_from"],
    matchWith: json["match_with"],
    matchType: json["match_type"],
    matchWithStatus: json["match_with_status"],
    matchFromStatus: json["match_from_status"],
    status: json["status"],
    roomid: json["roomid"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    getmaker: Getmaker.fromJson(json["getmaker"]),
    getseeker: Getseeker.fromJson(json["getseeker"]),
    getanotherseeker: Getanotherseeker.fromJson(json["getanotherseeker"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "maker_id": makerId,
    "match_from": matchFrom,
    "match_with": matchWith,
    "match_type": matchType,
    "match_with_status": matchWithStatus,
    "match_from_status": matchFromStatus,
    "status": status,
    "roomid": roomid,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "getmaker": getmaker.toJson(),
    "getseeker": getseeker.toJson(),
    "getanotherseeker": getanotherseeker.toJson(),
  };
}

class Getanotherseeker {
  int id;
  String name;
  String email;
  String phone;
  String occupation;
  String salary;
  String address;
  String height;
  String dob;
  String gender;
  String religion;
  int? currentStep;
  String imgPath;
  String videoPath;
  String occupationName;
  int likeStatus;
  Details details;

  Getanotherseeker({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.occupation,
    required this.salary,
    required this.address,
    required this.height,
    required this.dob,
    required this.gender,
    required this.religion,
    required this.currentStep,
    required this.imgPath,
    required this.videoPath,
    required this.occupationName,
    required this.likeStatus,
    required this.details,
  });

  factory Getanotherseeker.fromJson(Map<String, dynamic> json) => Getanotherseeker(
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
    details: Details.fromJson(json["details"]),
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
    "details": details.toJson(),
  };
}

class Details {
  int id;
  int seekerId;
  bool profileGallery;
  String inInterested;
  String interest;
  String bioTitle;
  String bioDescription;
  int status;
  String? createdAt;
  String updatedAt;
  List<String> gallaryPath;
  List<InterestName> interestName;

  Details({
    required this.id,
    required this.seekerId,
    required this.profileGallery,
    required this.inInterested,
    required this.interest,
    required this.bioTitle,
    required this.bioDescription,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.gallaryPath,
    required this.interestName,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["id"],
    seekerId: json["seeker_id"],
    profileGallery: json["profile_gallery"],
    inInterested: json["in_interested"],
    interest: json["interest"],
    bioTitle: json["bio_title"],
    bioDescription: json["bio_description"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    gallaryPath: List<String>.from(json["gallary_path"].map((x) => x)),
    interestName: List<InterestName>.from(json["interest_name"].map((x) => InterestName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seeker_id": seekerId,
    "profile_gallery": profileGallery,
    "in_interested": inInterested,
    "interest": interest,
    "bio_title": bioTitle,
    "bio_description": bioDescription,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "gallary_path": List<dynamic>.from(gallaryPath.map((x) => x)),
    "interest_name": List<dynamic>.from(interestName.map((x) => x.toJson())),
  };
}

class InterestName {
  String title;

  InterestName({
    required this.title,
  });

  factory InterestName.fromJson(Map<String, dynamic> json) => InterestName(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}

class Getmaker {
  int id;
  String name;
  String email;
  String phone;
  String dob;
  String gender;
  String location;
  String profileImg;
  String profileVideo;
  String experience;
  String aboutMaker;
  String expectation;
  String headingOfMaker;
  int status;
  int currentStep;
  String imgPath;
  String videoPath;

  Getmaker({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.gender,
    required this.location,
    required this.profileImg,
    required this.profileVideo,
    required this.experience,
    required this.aboutMaker,
    required this.expectation,
    required this.headingOfMaker,
    required this.status,
    required this.currentStep,
    required this.imgPath,
    required this.videoPath,
  });

  factory Getmaker.fromJson(Map<String, dynamic> json) => Getmaker(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    dob: json["dob"],
    gender: json["gender"],
    location: json["location"],
    profileImg: json["profile_img"],
    profileVideo: json["profile_video"],
    experience: json["experience"],
    aboutMaker: json["about_maker"],
    expectation: json["expectation"],
    headingOfMaker: json["heading_of_maker"],
    status: json["status"],
    currentStep: json["current_step"],
    imgPath: json["img_path"],
    videoPath: json["video_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "dob": dob,
    "gender": gender,
    "location": location,
    "profile_img": profileImg,
    "profile_video": profileVideo,
    "experience": experience,
    "about_maker": aboutMaker,
    "expectation": expectation,
    "heading_of_maker": headingOfMaker,
    "status": status,
    "current_step": currentStep,
    "img_path": imgPath,
    "video_path": videoPath,
  };
}

class Getseeker {
  int id;
  String name;
  String email;
  String phone;
  String occupation;
  String salary;
  String address;
  String height;
  String dob;
  String gender;
  String religion;
  int currentStep;
  String imgPath;
  String videoPath;
  String occupationName;
  int likeStatus;
  Details details;

  Getseeker({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.occupation,
    required this.salary,
    required this.address,
    required this.height,
    required this.dob,
    required this.gender,
    required this.religion,
    required this.currentStep,
    required this.imgPath,
    required this.videoPath,
    required this.occupationName,
    required this.likeStatus,
    required this.details,
  });

  factory Getseeker.fromJson(Map<String, dynamic> json) => Getseeker(
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
    details: Details.fromJson(json["details"]),
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
    "details": details.toJson(),
  };
}
