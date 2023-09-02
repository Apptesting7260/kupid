class RequestDetailsModel {
  RequestDetailsModel({
    this.status,
    this.data,
  });

  var  status;
  Data? data;

  RequestDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    this.id,
    this.makerId,
    this.matchFrom,
    this.matchWith,
    this.matchType,
    this.matchWithStatus,
    this.matchFromStatus,
    this.status,
    this.roomId,
    this.createdAt,
    this.updatedAt,
    this.getmaker,
    this.getseeker,
    this.getanotherseeker,
  });

  var id;
  var makerId;
  var matchFrom;
  var matchWith;
  var matchType;
  var  matchWithStatus;
  var  matchFromStatus;
  var status;
  var roomId;
  var  createdAt;
  var  updatedAt;
  Getmaker? getmaker;
  Getseeker? getseeker;
  Getseeker? getanotherseeker;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makerId = json['maker_id'];
    matchFrom = json['match_from'];
    matchWith = json['match_with'];
    matchType = json['match_type'];
    matchWithStatus = json['match_with_status'];
    matchFromStatus = json['match_from_status'];
    status = json['status'];
    roomId = json['roomid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getmaker = json['getmaker'] != null ? Getmaker.fromJson(json['getmaker']) : null;
    getseeker = json['getseeker']!=null? Getseeker.fromJson(json['getseeker']):null;
    getanotherseeker = json['getanotherseeker']!=null ?Getseeker.fromJson(json['getanotherseeker']):null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['maker_id'] = makerId;
    _data['match_from'] = matchFrom;
    _data['match_with'] = matchWith;
    _data['match_type'] = matchType;
    _data['match_with_status'] = matchWithStatus;
    _data['match_from_status'] = matchFromStatus;
    _data['status'] = status;
    _data['roomid'] = roomId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['getmaker'] = getmaker?.toJson();
    _data['getseeker'] = getseeker?.toJson();
    _data['getanotherseeker'] = getanotherseeker?.toJson();
    return _data;
  }
}

class Getmaker {
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

  var id;
  var  name;
  var  email;
  var  phone;
  var  dob;
  var  gender;
  var  location;
  var  profileImg;
  var  profileVideo;
  dynamic experience;
  var  aboutMaker;
  var  expectation;
  var  headingOfMaker;
  var status;
  var currentStep;
  var  imgPath;
  var  videoPath;

  Getmaker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    gender = json['gender'];
    location = json['location'];
    profileImg = json['profile_img'];
    profileVideo = json['profile_video'];
    experience = json['experience'];
    aboutMaker = json['about_maker'];
    expectation = json['expectation'];
    headingOfMaker = json['heading_of_maker'];
    status = json['status'];
    currentStep = json['current_step'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['location'] = location;
    _data['profile_img'] = profileImg;
    _data['profile_video'] = profileVideo;
    _data['experience'] = experience;
    _data['about_maker'] = aboutMaker;
    _data['expectation'] = expectation;
    _data['heading_of_maker'] = headingOfMaker;
    _data['status'] = status;
    _data['current_step'] = currentStep;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    return _data;
  }
}

class Getseeker {
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
    this.profileImg,
    this.profileVideo,
    this.gender,
    this.religion,
    this.currentStep,
    this.imgPath,
    this.videoPath,
    this.likeStatus,
    this.details,
  });

  var id;
  var  name;
  var  email;
  var  phone;
  var  occupation;
  var  salary;
  var  address;
  var  height;
  var  dob;
  var  profileImg;
  var  profileVideo;
  var  gender;
  var  religion;
  var currentStep;
  var  imgPath;
  var  videoPath;
  var likeStatus;
  Details? details;

  Getseeker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    occupation = json['occupation'];
    salary = json['salary'];
    address = json['address'];
    height = json['height'];
    dob = json['dob'];
    profileImg = json['profile_img'];
    profileVideo = json['profile_video'];
    gender = json['gender'];
    religion = json['religion'];
    currentStep = json['current_step'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    likeStatus = json['like_status'];
    details = json['details']!=null?Details.fromJson(json['details']):null;
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
    _data['profile_img'] = profileImg;
    _data['profile_video'] = profileVideo;
    _data['gender'] = gender;
    _data['religion'] = religion;
    _data['current_step'] = currentStep;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['like_status'] = likeStatus;
    _data['details'] = details!.toJson();
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
  bool? profileGallery;
  var  inInterested;
  var  interest;
  var  bioTitle;
  var  bioDescription;
  var status;
  dynamic createdAt;
  var  updatedAt;
  List<String>? gallaryPath;
  List<InterestName>? interestName;

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
    gallaryPath = json['gallary_path']!=null?List.castFrom<dynamic, String>(json['gallary_path']):[];
    interestName = json['interest_name']!=null? (json['interest_name'] as List<dynamic>)
        .map((e) => InterestName.fromJson(e))
        .toList():[];
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
    _data['interest_name'] = interestName!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class InterestName {
  InterestName({
    this.title,
  });

  var  title;

  InterestName.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    return _data;
  }
}
