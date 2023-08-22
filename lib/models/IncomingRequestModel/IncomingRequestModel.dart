class IncomingRequestModel {
  String? status;
  List<Request>? requests;

  IncomingRequestModel({
    this.status,
    this.requests,
  });

  factory IncomingRequestModel.fromJson(Map<String, dynamic> json) {
    return IncomingRequestModel(
      status: json['status'],
      requests: (json['requests'] as List<dynamic>?)
          ?.map((json) => Request.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Request {
  int? id;
  int? makerId;
  int? matchFrom;
  int? matchWith;
  int? matchType;
  String? matchWithStatus;
  dynamic matchFromStatus;
  int? status;
  String? createdAt;
  String? updatedAt;
  GetMaker? getMaker;
  GetSeeker? getSeeker;

  Request({
    this.id,
    this.makerId,
    this.matchFrom,
    this.matchWith,
    this.matchType,
    this.matchWithStatus,
    this.matchFromStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.getMaker,
    this.getSeeker,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id'] as int?,
      makerId: json['maker_id'] as int?,
      matchFrom: json['match_from'] as int?,
      matchWith: json['match_with'] as int?,
      matchType: json['match_type'] as int?,
      matchWithStatus: json['match_with_status'],
      matchFromStatus: json['match_from_status'],
      status: json['status'] as int?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      getMaker: json['getmaker'] != null
          ? GetMaker.fromJson(json['getmaker'] as Map<String, dynamic>)
          : null,
      getSeeker: json['getseeker'] != null
          ? GetSeeker.fromJson(json['getseeker'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetMaker {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? dob;
  String? gender;
  String? location;
  String? profileImg;
  String? profileVideo;
  dynamic experience;
  String? aboutMaker;
  String? expectation;
  String? headingOfMaker;
  int? status;
  int? currentStep;
  String? imgPath;
  String? videoPath;

  GetMaker({
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

  factory GetMaker.fromJson(Map<String, dynamic> json) {
    return GetMaker(
      id: json['id'] as int?,
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      dob: json['dob'],
      gender: json['gender'],
      location: json['location'],
      profileImg: json['profile_img'],
      profileVideo: json['profile_video'],
      experience: json['experience'],
      aboutMaker: json['about_maker'],
      expectation: json['expectation'],
      headingOfMaker: json['heading_of_maker'],
      status: json['status'] as int?,
      currentStep: json['current_step'] as int?,
      imgPath: json['img_path'],
      videoPath: json['video_path'],
    );
  }
}

class GetSeeker {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? occupation;
  String? salary;
  String? address;
  String? height;
  String? dob;
  String? profileImg;
  String? profileVideo;
  String? gender;
  String? religion;
  int? currentStep;
  String? imgPath;
  String? videoPath;

  GetSeeker({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.occupation,
    this.salary,
    this.address,
    this.height,
    this.dob,
    this.profileImg,
    this.profileVideo,
    this.gender,
    this.religion,
    this.currentStep,
    this.imgPath,
    this.videoPath,
  });

  factory GetSeeker.fromJson(Map<String, dynamic> json) {
    return GetSeeker(
      id: json['id'] as int?,
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      occupation: json['occupation'],
      salary: json['salary'],
      address: json['address'],
      height: json['height'],
      dob: json['dob'],
      profileImg: json['profile_img'],
      profileVideo: json['profile_video'],
      gender: json['gender'],
      religion: json['religion'],
      currentStep: json['current_step'] as int?,
      imgPath: json['img_path'],
      videoPath: json['video_path'],
    );
  }
}