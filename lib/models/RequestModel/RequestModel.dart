// To parse this JSON data, do
//
//     final seekerOutgoingRequestSinglePageModel = seekerOutgoingRequestSinglePageModelFromJson(jsonString);

import 'dart:convert';

RequestDetailsModel seekerOutgoingRequestSinglePageModelFromJson(String str) => RequestDetailsModel.fromJson(json.decode(str));

String seekerOutgoingRequestSinglePageModelToJson(RequestDetailsModel data) => json.encode(data.toJson());

class RequestDetailsModel {
  String? status;
  String? message;
  Data? data;

  RequestDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) => RequestDetailsModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
 var id;
 var makerId;
 var matchFrom;
String? matchWith;
 var matchType;
  var matchWithStatus;
  var matchFromStatus;
 var status;
 var roomid;
  var createdAt;
  var updatedAt;
  Getmaker? getmaker;
  Getseeker? getseeker;
  Getseeker? getanotherseeker;

  Data({
    this.id,
    this.makerId,
    this.matchFrom,
    this.matchWith,
    this.matchType,
    this.matchWithStatus,
    this.matchFromStatus,
    this.status,
    this.roomid,
    this.createdAt,
    this.updatedAt,
    this.getmaker,
    this.getseeker,
    this.getanotherseeker,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    makerId: json["maker_id"],
    matchFrom: json["match_from"],
    matchWith: json["match_with"].toString(),
    matchType: json["match_type"],
    matchWithStatus: json["match_with_status"],
    matchFromStatus: json["match_from_status"],
    status: json["status"],
    roomid: json["roomid"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    getmaker: json["getmaker"] == null ? null : Getmaker.fromJson(json["getmaker"]),
    getseeker: json["getseeker"] == null ? null : Getseeker.fromJson(json["getseeker"]),
    getanotherseeker: json["getanotherseeker"] == null ? null : Getseeker.fromJson(json["getanotherseeker"]),
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "getmaker": getmaker?.toJson(),
    "getseeker": getseeker?.toJson(),
    "getanotherseeker": getanotherseeker?.toJson(),
  };
}

class Getseeker {
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
  Details? details;

  Getseeker({
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
    this.details,
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
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
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
    "details": details?.toJson(),
  };
}

class Details {
 var id;
 var seekerId;
  bool? profileGallery;
  var inInterested;
  var interest;
  var bioTitle;
  var bioDescription;
 var status;
  var createdAt;
 var updatedAt;
  List<String>? gallaryPath;
  List<InterestName>? interestName;

  Details({
    this.id,
    this.seekerId,
    this.profileGallery,
    this.inInterested,
    this.interest,
    this.bioTitle,
    this.bioDescription,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.gallaryPath,
    this.interestName,
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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    gallaryPath: json["gallary_path"] == null ? [] : List<String>.from(json["gallary_path"]!.map((x) => x)),
    interestName: json["interest_name"] == null ? [] : List<InterestName>.from(json["interest_name"]!.map((x) => InterestName.fromJson(x))),
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "gallary_path": gallaryPath == null ? [] : List<dynamic>.from(gallaryPath!.map((x) => x)),
    "interest_name": interestName == null ? [] : List<dynamic>.from(interestName!.map((x) => x.toJson())),
  };
}

class InterestName {
  var title;

  InterestName({
    this.title,
  });

  factory InterestName.fromJson(Map<String, dynamic> json) => InterestName(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}

class Getmaker {
 var id;
  var name;
  var email;
  var phone;
  var dob;
  var gender;
  var location;
  var profileImg;
  var profileVideo;
  var experience;
  var aboutMaker;
  var expectation;
  var headingOfMaker;
 var status;
 var currentStep;
  var imgPath;
  var videoPath;

  Getmaker({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dob,
    this.gender,
    this.location,
    this.profileImg,
    this.profileVideo,
    this.experience,
    this.aboutMaker,
    this.expectation,
    this.headingOfMaker,
    this.status,
    this.currentStep,
    this.imgPath,
    this.videoPath,
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











// class RequestDetailsModel {
//   RequestDetailsModel({
//      this.status,
//      this.message,
//      this.data,
//   });
//    var status;
//    var message;
//    Data ?data;
//
//   RequestDetailsModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     data = Data.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data!.toJson();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//      this.id,
//      this.makerId,
//      this.matchFrom,
//      this.matchWith,
//      this.matchType,
//      this.matchWithStatus,
//      this.matchFromStatus,
//      this.status,
//      this.roomid,
//      this.createdAt,
//      this.updatedAt,
//      this.getmaker,
//      this.getseeker,
//      this.getanotherseeker,
//   });
//    var id;
//    var makerId;
//    var matchFrom;
//    var matchWith;
//    var matchType;
//    var matchWithStatus;
//    var matchFromStatus;
//    var status;
//    var roomid;
//    var createdAt;
//    var updatedAt;
//    Getmaker? getmaker;
//    Getseeker ?getseeker;
//    Getanotherseeker ?getanotherseeker;
//
//   Data.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     makerId = json['maker_id'];
//     matchFrom = json['match_from'];
//     matchWith = json['match_with'];
//     matchType = json['match_type'];
//     matchWithStatus = json['match_with_status'];
//     matchFromStatus = json['match_from_status'];
//     status = json['status'];
//     roomid = json['roomid'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     getmaker = Getmaker.fromJson(json['getmaker']);
//     getseeker = Getseeker.fromJson(json['getseeker']);
//     getanotherseeker = Getanotherseeker.fromJson(json['getanotherseeker']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['maker_id'] = makerId;
//     _data['match_from'] = matchFrom;
//     _data['match_with'] = matchWith;
//     _data['match_type'] = matchType;
//     _data['match_with_status'] = matchWithStatus;
//     _data['match_from_status'] = matchFromStatus;
//     _data['status'] = status;
//     _data['roomid'] = roomid;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['getmaker'] = getmaker!.toJson();
//     _data['getseeker'] = getseeker!.toJson();
//     _data['getanotherseeker'] = getanotherseeker!.toJson();
//     return _data;
//   }
// }
//
// class Getmaker {
//   Getmaker({
//      this.id,
//      this.name,
//      this.email,
//      this.phone,
//      this.dob,
//      this.gender,
//      this.location,
//      this.profileImg,
//      this.profileVideo,
//      this.experience,
//      this.aboutMaker,
//      this.expectation,
//      this.headingOfMaker,
//      this.status,
//      this.currentStep,
//      this.imgPath,
//      this.videoPath,
//   });
//    var id;
//    var name;
//    var email;
//    var phone;
//    var dob;
//    var gender;
//    var location;
//    var profileImg;
//    var profileVideo;
//    var experience;
//    var aboutMaker;
//    var expectation;
//    var headingOfMaker;
//    var status;
//    var currentStep;
//    var imgPath;
//    var videoPath;
//
//   Getmaker.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     dob = json['dob'];
//     gender = json['gender'];
//     location = json['location'];
//     profileImg = json['profile_img'];
//     profileVideo = json['profile_video'];
//     experience = json['experience'];
//     aboutMaker = json['about_maker'];
//     expectation = json['expectation'];
//     headingOfMaker = json['heading_of_maker'];
//     status = json['status'];
//     currentStep = json['current_step'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['dob'] = dob;
//     _data['gender'] = gender;
//     _data['location'] = location;
//     _data['profile_img'] = profileImg;
//     _data['profile_video'] = profileVideo;
//     _data['experience'] = experience;
//     _data['about_maker'] = aboutMaker;
//     _data['expectation'] = expectation;
//     _data['heading_of_maker'] = headingOfMaker;
//     _data['status'] = status;
//     _data['current_step'] = currentStep;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     return _data;
//   }
// }
//
// class Getseeker {
//   Getseeker({
//      this.id,
//      this.name,
//      this.email,
//      this.phone,
//      this.occupation,
//      this.salary,
//      this.address,
//      this.height,
//      this.dob,
//      this.gender,
//      this.religion,
//      this.currentStep,
//      this.imgPath,
//      this.videoPath,
//      this.occupationName,
//      this.likeStatus,
//      this.details,
//   });
//    var id;
//    var name;
//    var email;
//    var phone;
//    var occupation;
//    var salary;
//    var address;
//    var height;
//    var dob;
//    var gender;
//    var religion;
//    var currentStep;
//    var imgPath;
//    var videoPath;
//    var occupationName;
//    var likeStatus;
//    Details ?details;
//
//   Getseeker.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     occupation = json['occupation'];
//     salary = json['salary'];
//     address = json['address'];
//     height = json['height'];
//     dob = json['dob'];
//     gender = json['gender'];
//     religion = json['religion'];
//     currentStep = json['current_step'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//     occupationName = json['occupation_name'];
//     likeStatus = json['like_status'];
//     details = Details.fromJson(json['details']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['occupation'] = occupation;
//     _data['salary'] = salary;
//     _data['address'] = address;
//     _data['height'] = height;
//     _data['dob'] = dob;
//     _data['gender'] = gender;
//     _data['religion'] = religion;
//     _data['current_step'] = currentStep;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     _data['occupation_name'] = occupationName;
//     _data['like_status'] = likeStatus;
//     _data['details'] = details!.toJson();
//     return _data;
//   }
// }
//
// class Details {
//   Details({
//      this.id,
//      this.seekerId,
//      this.profileGallery,
//      this.inInterested,
//      this.interest,
//      this.bioTitle,
//      this.bioDescription,
//      this.status,
//      this.createdAt,
//      this.updatedAt,
//      this.gallaryPath,
//      this.interestName,
//   });
//    var id;
//    var seekerId;
//    var profileGallery;
//    var inInterested;
//    var interest;
//    var bioTitle;
//    var bioDescription;
//    var status;
//    var createdAt;
//    var updatedAt;
//    List<String>? gallaryPath;
//    List<dynamic>? interestName;
//
//   Details.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     seekerId = json['seeker_id'];
//     profileGallery = json['profile_gallery'];
//     inInterested = json['in_interested'];
//     interest = json['interest'];
//     bioTitle = json['bio_title'];
//     bioDescription = json['bio_description'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     gallaryPath = List.castFrom<dynamic, String>(json['gallary_path']);
//     interestName = List.castFrom<dynamic, dynamic>(json['interest_name']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['seeker_id'] = seekerId;
//     _data['profile_gallery'] = profileGallery;
//     _data['in_interested'] = inInterested;
//     _data['interest'] = interest;
//     _data['bio_title'] = bioTitle;
//     _data['bio_description'] = bioDescription;
//     _data['status'] = status;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['gallary_path'] = gallaryPath;
//     _data['interest_name'] = interestName;
//     return _data;
//   }
// }
//
// class Getanotherseeker {
//   Getanotherseeker({
//      this.id,
//      this.name,
//      this.email,
//      this.phone,
//      this.occupation,
//      this.salary,
//      this.address,
//      this.height,
//      this.dob,
//      this.gender,
//      this.religion,
//      this.currentStep,
//      this.imgPath,
//      this.videoPath,
//      this.occupationName,
//      this.likeStatus,
//      this.details,
//   });
//    var id;
//    var name;
//    var email;
//    var phone;
//    var occupation;
//    var salary;
//    var address;
//    var height;
//    var dob;
//    var gender;
//    var religion;
//    var currentStep;
//    var imgPath;
//    var videoPath;
//    var occupationName;
//    var likeStatus;
//    Details? details;
//
//   Getanotherseeker.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     occupation = json['occupation'];
//     salary = json['salary'];
//     address = json['address'];
//     height = json['height'];
//     dob = json['dob'];
//     gender = json['gender'];
//     religion = json['religion'];
//     currentStep = json['current_step'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//     occupationName = json['occupation_name'];
//     likeStatus = json['like_status'];
//     details = Details.fromJson(json['details']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['occupation'] = occupation;
//     _data['salary'] = salary;
//     _data['address'] = address;
//     _data['height'] = height;
//     _data['dob'] = dob;
//     _data['gender'] = gender;
//     _data['religion'] = religion;
//     _data['current_step'] = currentStep;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     _data['occupation_name'] = occupationName;
//     _data['like_status'] = likeStatus;
//     _data['details'] = details!.toJson();
//     return _data;
//   }
// }