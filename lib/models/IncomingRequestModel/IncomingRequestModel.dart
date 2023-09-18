class IncomingRequestModel {
  String? status;
  List<Request>? requests;
  String? message;

  IncomingRequestModel({
    this.status,
    this.requests,
    this.message
  });

  factory IncomingRequestModel.fromJson(Map<String, dynamic> json) {
    return IncomingRequestModel(
      status: json['status'],
      message: json['message'],
      requests: (json['requests'] as List<dynamic>?)
          ?.map((json) => Request.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (requests != null) {
      data['requests'] = requests!.map((request) => request.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['maker_id'] = makerId;
    data['match_from'] = matchFrom;
    data['match_with'] = matchWith;
    data['match_type'] = matchType;
    data['match_with_status'] = matchWithStatus;
    data['match_from_status'] = matchFromStatus;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (getMaker != null) {
      data['getmaker'] = getMaker!.toJson();
    }
    if (getSeeker != null) {
      data['getseeker'] = getSeeker!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['dob'] = dob;
    data['gender'] = gender;
    data['location'] = location;
    data['profile_img'] = profileImg;
    data['profile_video'] = profileVideo;
    data['experience'] = experience;
    data['about_maker'] = aboutMaker;
    data['expectation'] = expectation;
    data['heading_of_maker'] = headingOfMaker;
    data['status'] = status;
    data['current_step'] = currentStep;
    data['img_path'] = imgPath;
    data['video_path'] = videoPath;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['occupation'] = occupation;
    data['salary'] = salary;
    data['address'] = address;
    data['height'] = height;
    data['dob'] = dob;
    data['profile_img'] = profileImg;
    data['profile_video'] = profileVideo;
    data['gender'] = gender;
    data['religion'] = religion;
    data['current_step'] = currentStep;
    data['img_path'] = imgPath;
    data['video_path'] = videoPath;
    return data;
  }
}
