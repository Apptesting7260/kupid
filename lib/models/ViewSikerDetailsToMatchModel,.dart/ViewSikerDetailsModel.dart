class ViewSikerDetailsToMatchModel {
  String? status;
  List<ProfileDetail>? profileDetails;

  ViewSikerDetailsToMatchModel({
    this.status,
    this.profileDetails,
  });

  factory ViewSikerDetailsToMatchModel.fromJson(Map<String, dynamic> json) {
    return ViewSikerDetailsToMatchModel(
      status: json['status'],
      profileDetails: json['ProfileDetails'] != null
          ? List<ProfileDetail>.from(
              json['ProfileDetails'].map((x) => ProfileDetail.fromJson(x)))
          : null,
    );
  }
}

class ProfileDetail {
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
  dynamic profileVideo;
  String? gender;
  String? religion;
  dynamic currentStep;
  String imgPath;
  String videoPath;
  Details? details;

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
    this.profileImg,
    this.profileVideo,
    this.gender,
    this.religion,
    this.currentStep,
    required this.imgPath,
    required this.videoPath,
    this.details,
  });

  factory ProfileDetail.fromJson(Map<String, dynamic> json) {
    return ProfileDetail(
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
      details: json['details'] != null ? Details.fromJson(json['details']) : null,
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
  List<String>? gallaryPath;

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
          ? List<String>.from(json['gallary_path'].map((x) => x))
          : null,
    );
  }
}
