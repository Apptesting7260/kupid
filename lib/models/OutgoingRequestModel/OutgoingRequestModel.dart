class OutgoingRequestModel {
  String? status;
  List<OutgoingMatchRequest>? requests;

  OutgoingRequestModel({
    this.status,
    this.requests,
  });

  factory OutgoingRequestModel.fromJson(Map<String, dynamic> json) {
    return OutgoingRequestModel(
      status: json['status'],
      requests: (json['requests'] as List<dynamic>?)
          ?.map((requestJson) => OutgoingMatchRequest.fromJson(requestJson))
          .toList(),
    );
  }
}

class OutgoingMatchRequest {
  int? id;
  int? makerId;
  int? matchFrom;
  int? matchWith;
  int? matchType;
  String? matchWithStatus;
  String? matchFromStatus;
  int? status;
  String? createdAt;
  String? updatedAt;
  OutgoingSeeker? getMaker;
  OutgoingSeeker? getSeeker;

  OutgoingMatchRequest({
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

  factory OutgoingMatchRequest.fromJson(Map<String, dynamic> json) {
    return OutgoingMatchRequest(
      id: json['id'],
      makerId: json['maker_id'],
      matchFrom: json['match_from'],
      matchWith: json['match_with'],
      matchType: json['match_type'],
      matchWithStatus: json['match_with_status'],
      matchFromStatus: json['match_from_status'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      getMaker: json['getmaker'] != null ? OutgoingSeeker.fromJson(json['getmaker']) : null,
      getSeeker: OutgoingSeeker.fromJson(json['getseeker']),
    );
  }
}

class OutgoingSeeker {
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

  OutgoingSeeker({
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

  factory OutgoingSeeker.fromJson(Map<String, dynamic> json) {
    return OutgoingSeeker(
      id: json['id'],
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
      currentStep: json['current_step'],
      imgPath: json['img_path'],
      videoPath: json['video_path'],
    );
  }
}