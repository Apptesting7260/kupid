class ViewSikerDetailsToMatchModel {
  String? status;
  List<ProfileDetails>? profileDetails;

  ViewSikerDetailsToMatchModel({
    this.status,
    this.profileDetails,
  });

  factory ViewSikerDetailsToMatchModel.fromJson(Map<String, dynamic> json) {
    return ViewSikerDetailsToMatchModel(
      status: json['status'],
      profileDetails: json['ProfileDetails'] != null
          ? List<ProfileDetails>.from(
              json['ProfileDetails'].map((e) => ProfileDetails.fromJson(e)),
            )
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
  int? status;
  int? currentStep;
  String? imgPath;
  String? videoPath;
  Details? details;

  ProfileDetails.fromJson(Map<String, dynamic> json) {
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
    status = json['status'];
    currentStep = json['current_step'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
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
  List<String>? galleryPath;

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
    galleryPath = json['galleryPath'] != null ? List<String>.from(json['galleryPath']) : null;
  }
}
