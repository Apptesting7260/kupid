class IncomingRequestModel {
  String? status;
  String? message;
  Requests? requests;

  IncomingRequestModel({this.status, this.message, this.requests});

  IncomingRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    requests = json['requests'] != null
        ? new Requests.fromJson(json['requests'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.requests != null) {
      data['requests'] = this.requests!.toJson();
    }
    return data;
  }
}

class Requests {
  List<ByMaker>? byMaker;
  List<BySeeker>? bySeeker;

  Requests({this.byMaker, this.bySeeker});

  Requests.fromJson(Map<String, dynamic> json) {
    if (json['by_maker'] != null) {
      byMaker = <ByMaker>[];
      json['by_maker'].forEach((v) {
        byMaker!.add(new ByMaker.fromJson(v));
      });
    }
    if (json['by_seeker'] != null) {
      bySeeker = <BySeeker>[];
      json['by_seeker'].forEach((v) {
        bySeeker!.add(new BySeeker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.byMaker != null) {
      data['by_maker'] = this.byMaker!.map((v) => v.toJson()).toList();
    }
    if (this.bySeeker != null) {
      data['by_seeker'] = this.bySeeker!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ByMaker {
  int? id;
  int? makerId;
  int? matchFrom;
  int? matchWith;
  int? matchType;
  String? matchWithStatus;
  String? matchFromStatus;
  int? status;
  int? roomid;
  String? createdAt;
  String? updatedAt;
  Getmaker? getmaker;
  Getseeker? getseeker;

  ByMaker(
      {this.id,
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
        this.getseeker});

  ByMaker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makerId = json['maker_id'];
    matchFrom = json['match_from'];
    matchWith = json['match_with'];
    matchType = json['match_type'];
    matchWithStatus = json['match_with_status'];
    matchFromStatus = json['match_from_status'];
    status = json['status'];
    roomid = json['roomid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getmaker = json['getmaker'] != null
        ? new Getmaker.fromJson(json['getmaker'])
        : null;
    getseeker = json['getseeker'] != null
        ? new Getseeker.fromJson(json['getseeker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maker_id'] = this.makerId;
    data['match_from'] = this.matchFrom;
    data['match_with'] = this.matchWith;
    data['match_type'] = this.matchType;
    data['match_with_status'] = this.matchWithStatus;
    data['match_from_status'] = this.matchFromStatus;
    data['status'] = this.status;
    data['roomid'] = this.roomid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.getmaker != null) {
      data['getmaker'] = this.getmaker!.toJson();
    }
    if (this.getseeker != null) {
      data['getseeker'] = this.getseeker!.toJson();
    }
    return data;
  }
}

class Getmaker {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? dob;
  String? gender;
  String? location;
  String? profileImg;
  String? profileVideo;
  String? experience;
  String? aboutMaker;
  String? expectation;
  String? headingOfMaker;
  int? status;
  int? currentStep;
  String? imgPath;
  String? videoPath;

  Getmaker(
      {this.id,
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
        this.videoPath});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['location'] = this.location;
    data['profile_img'] = this.profileImg;
    data['profile_video'] = this.profileVideo;
    data['experience'] = this.experience;
    data['about_maker'] = this.aboutMaker;
    data['expectation'] = this.expectation;
    data['heading_of_maker'] = this.headingOfMaker;
    data['status'] = this.status;
    data['current_step'] = this.currentStep;
    data['img_path'] = this.imgPath;
    data['video_path'] = this.videoPath;
    return data;
  }
}

class Getseeker {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? occupation;
  String? salary;
  String? address;
  String? height;
  String? dob;
  String? gender;
  String? religion;
  int? currentStep;
  String? imgPath;
  String? videoPath;
  String? occupationName;
  int? likeStatus;
  Details? details;

  Getseeker(
      {this.id,
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
        this.details});

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
    gender = json['gender'];
    religion = json['religion'];
    currentStep = json['current_step'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    occupationName = json['occupation_name'];
    likeStatus = json['like_status'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['occupation'] = this.occupation;
    data['salary'] = this.salary;
    data['address'] = this.address;
    data['height'] = this.height;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['current_step'] = this.currentStep;
    data['img_path'] = this.imgPath;
    data['video_path'] = this.videoPath;
    data['occupation_name'] = this.occupationName;
    data['like_status'] = this.likeStatus;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  int? id;
  int? seekerId;
  bool? profileGallery;
  String? inInterested;
  String? interest;
  String? bioTitle;
  String? bioDescription;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<String>? gallaryPath;
  List<InterestName>? interestName;

  Details(
      {this.id,
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
        this.interestName});

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
    gallaryPath = json['gallary_path'].cast<String>();
    if (json['interest_name'] != null) {
      interestName = <InterestName>[];
      json['interest_name'].forEach((v) {
        interestName!.add(new InterestName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seeker_id'] = this.seekerId;
    data['profile_gallery'] = this.profileGallery;
    data['in_interested'] = this.inInterested;
    data['interest'] = this.interest;
    data['bio_title'] = this.bioTitle;
    data['bio_description'] = this.bioDescription;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['gallary_path'] = this.gallaryPath;
    if (this.interestName != null) {
      data['interest_name'] =
          this.interestName!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InterestName {
  String? title;

  InterestName({this.title});

  InterestName.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}

class BySeeker {
  int? id;
  Null? makerId;
  int? matchFrom;
  int? matchWith;
  int? matchType;
  String? matchWithStatus;
  Null? matchFromStatus;
  int? status;
  int? roomid;
  String? createdAt;
  String? updatedAt;
  Getseeker? getseeker;

  BySeeker(
      {this.id,
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
        this.getseeker});

  BySeeker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makerId = json['maker_id'];
    matchFrom = json['match_from'];
    matchWith = json['match_with'];
    matchType = json['match_type'];
    matchWithStatus = json['match_with_status'];
    matchFromStatus = json['match_from_status'];
    status = json['status'];
    roomid = json['roomid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getseeker = json['getseeker'] != null
        ? new Getseeker.fromJson(json['getseeker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maker_id'] = this.makerId;
    data['match_from'] = this.matchFrom;
    data['match_with'] = this.matchWith;
    data['match_type'] = this.matchType;
    data['match_with_status'] = this.matchWithStatus;
    data['match_from_status'] = this.matchFromStatus;
    data['status'] = this.status;
    data['roomid'] = this.roomid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.getseeker != null) {
      data['getseeker'] = this.getseeker!.toJson();
    }
    return data;
  }
}
