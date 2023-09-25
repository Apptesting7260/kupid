class SeekerMyProfileDetailModel {
  SeekerMyProfileDetailModel({
    this.status,
    this.message,
    this.ProfileDetails,
  });
  String? status;
  String? message;
  ProfileDetail? ProfileDetails;

  SeekerMyProfileDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    ProfileDetails = ProfileDetail.fromJson(json['ProfileDetails']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['ProfileDetails'] = ProfileDetails!.toJson();
    return _data;
  }
}

class ProfileDetail {
  ProfileDetail({
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
    this.spinLeverRequestedData,
    this.imgPath,
    this.videoPath,
    this.occupationName,
    this.likeStatus,
    this.details,
  });
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
  List<SpinLeverRequestedData>? spinLeverRequestedData;
  var imgPath;
  var videoPath;
  var occupationName;
  var likeStatus;
  Details? details;

  ProfileDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    occupation = json['occupation'];
    salary = json['salary'];
    address = json['address'];
    height = json['height'];
    dob = json['dob'];
    gender = json['gender'];
    religion = json['religion'];
    currentStep = json['current_step'];
    spinLeverRequestedData = List.from(json['spinLeverRequestedData'])
        .map((e) => SpinLeverRequestedData.fromJson(e))
        .toList();
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    occupationName = json['occupation_name'];
    likeStatus = json['like_status'];
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['occupation'] = occupation;
    _data['salary'] = salary;
    _data['address'] = address;
    _data['height'] = height;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['religion'] = religion;
    _data['current_step'] = currentStep;
    _data['spinLeverRequestedData'] =
        spinLeverRequestedData!.map((e) => e.toJson()).toList();
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['occupation_name'] = occupationName;
    _data['like_status'] = likeStatus;
    _data['details'] = details!.toJson();
    return _data;
  }
}

class SpinLeverRequestedData {
  SpinLeverRequestedData({
    this.id,
    this.seekerId,
    this.type,
    this.spinLiverRequestedStatus,
  });
  var id;
  var seekerId;
  var type;
  var spinLiverRequestedStatus;

  SpinLeverRequestedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seekerId = json['seeker_id'];
    type = json['type'];
    spinLiverRequestedStatus = json['spin_liver_requested_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['seeker_id'] = seekerId;
    _data['type'] = type;
    _data['spin_liver_requested_status'] = spinLiverRequestedStatus;
    return _data;
  }
}

class Details {
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
  var id;
  var seekerId;
  var profileGallery;
  var inInterested;
  var interest;
  var bioTitle;
  var bioDescription;
  var status;
  var createdAt;
  var updatedAt;
  List<String>? gallaryPath;
  List<dynamic>? interestName;

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seekerId = json['seeker_id'];
    profileGallery = json['profile_gallery'];
    inInterested = json['in_interested'];
    interest = json['interest'];
    bioTitle = json['bio_title'];
    bioDescription = json['bio_description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gallaryPath = List.castFrom<dynamic, String>(json['gallary_path']);
    interestName = List.castFrom<dynamic, dynamic>(json['interest_name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['seeker_id'] = seekerId;
    _data['profile_gallery'] = profileGallery;
    _data['in_interested'] = inInterested;
    _data['interest'] = interest;
    _data['bio_title'] = bioTitle;
    _data['bio_description'] = bioDescription;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['gallary_path'] = gallaryPath;
    _data['interest_name'] = interestName;
    return _data;
  }
}
