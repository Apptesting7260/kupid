class ViewProfileDetailsModel {
  ViewProfileDetailsModel({
     this.status,
     this.ProfileDetail,
  });
   String? status;
   ProfileDetails? ProfileDetail;
  
  ViewProfileDetailsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    ProfileDetail = ProfileDetails.fromJson(json['ProfileDetails']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['ProfileDetails'] = ProfileDetail!.toJson();
    return _data;
  }
}

class ProfileDetails {
  ProfileDetails({
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
     this.status,
     this.currentStep,
     this.imgPath,
     this.videoPath,
     this.details,
  });
   int? id;
   String? name;
   String ?email;
   String ?phone;
   String ?occupation;
   String ?salary;
   String ?address;
   String ?height;
   String ?dob;
   String ?profileImg;
   String ?profileVideo;
   String ?gender;
  String ?religion;
   int ?status;
   int ?currentStep;
   String ?imgPath;
   String ?videoPath;
   Details ?details;
  
  ProfileDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = null;
    occupation = json['occupation'];
    salary = null;
    address = json['address'];
    height = json['height'];
    dob = json['dob'];
    profileImg = json['profile_img'];
    profileVideo = json['profile_video'];
    gender = json['gender'];
    religion = null;
    status = json['status'];
    currentStep = json['current_step'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
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
    _data['profile_img'] = profileImg;
    _data['profile_video'] = profileVideo;
    _data['gender'] = gender;
    _data['religion'] = religion;
    _data['status'] = status;
    _data['current_step'] = currentStep;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
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
  });
   int ?id;
   int ?seekerId;
   String? profileGallery;
   String ?inInterested;
   String ?interest;
   String ?bioTitle;
   String ?bioDescription;
   int ?status;
   String? createdAt;
   String? updatedAt;
  
  Details.fromJson(Map<String, dynamic> json){
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
    return _data;
  }
}