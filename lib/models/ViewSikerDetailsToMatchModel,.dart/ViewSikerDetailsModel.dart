class ViewSikerDetailsToMatchModel {
  String? status;
  List<ProfileDetails>? profileDetails;

  ViewSikerDetailsToMatchModel({this.status, this.profileDetails});

  factory ViewSikerDetailsToMatchModel.fromJson(Map<String, dynamic> json) {
    return ViewSikerDetailsToMatchModel(
      status: json['status'],
      profileDetails: json['ProfileDetails'] != null
          ? List<ProfileDetails>.from(
              json['ProfileDetails'].map((x) => ProfileDetails.fromJson(x)))
          : null,
    );
  }
}

class ProfileDetails {
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
  dynamic currentStep;
  String? imgPath;
  String? videoPath;
  String? occupationName;
  int? likeStatus;
  Details? details;

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
    this.currentStep,
    this.imgPath,
    this.videoPath,
    this.occupationName,
    this.likeStatus,
    this.details,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) {
    return ProfileDetails(
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
      occupationName: json['occupation_name'],
      likeStatus: json['like_status'],
      details: Details.fromJson(json['details']),
    );
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
  List<dynamic>? gallaryPath;
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

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['id'],
      seekerId: json['seeker_id'],
      profileGallery: json['profile_gallery'],
      inInterested: json['in_interested'],
      interest: json['interest'],
      bioTitle: json['bio_title'],
      bioDescription: json['bio_description'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      gallaryPath: json['gallary_path'] != null
          ? List<dynamic>.from(json['gallary_path'])
          : null,
      interestName: json['interest_name'] != null
          ? List<InterestName>.from(
              json['interest_name'].map((x) => InterestName.fromJson(x)))
          : null,
    );
  }
}

class InterestName {
  String? title;

  InterestName({this.title});

  factory InterestName.fromJson(Map<String, dynamic> json) {
    return InterestName(
      title: json['title'],
    );
  }
}
