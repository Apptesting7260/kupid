class SeekerHomeRequestModel {
 var status;
  var message;
  Requests? requests;

  SeekerHomeRequestModel({ this.status,  this.message,  this.requests});

  factory SeekerHomeRequestModel.fromJson(Map<String, dynamic> json) {
    return SeekerHomeRequestModel(
      status: json['status'],
      message: json['message'],
      requests: Requests.fromJson(json['requests']),
    );
  }
}

class Requests {
  List<Request> ?incoming;
  List<Request> ?outgoing;

  Requests({ this.incoming,  this.outgoing});

  factory Requests.fromJson(Map<String, dynamic> json) {
    return Requests(
      incoming: (json['incoming'] as List<dynamic>)
          .map((incomingJson) => Request.fromJson(incomingJson))
          .toList(),
      outgoing: (json['outgoing'] as List<dynamic>)
          .map((outgoingJson) => Request.fromJson(outgoingJson))
          .toList(),
    );
  }
}

class Request {
  var id;
  var makerId;
  var matchFrom;
  var matchWith;
  var matchType;
 var matchWithStatus;
  var matchFromStatus;
  var status;
  var roomid;
 var createdAt;
  var updatedAt;
  MakerProfile? getmaker;
  SeekerProfile? getseeker;
  SeekerProfile? getanotherseeker;

  Request({
     this.id,
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
     this.getseeker,
    this.getanotherseeker,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id'],
      makerId: json['maker_id'],
      matchFrom: json['match_from'],
      matchWith: json['match_with'],
      matchType: json['match_type'],
      matchWithStatus: json['match_with_status'],
      matchFromStatus: json['match_from_status'],
      status: json['status'],
      roomid: json['roomid'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      getmaker: json['getmaker'] != null ? MakerProfile.fromJson(json['getmaker']) : null,
      getseeker: SeekerProfile.fromJson(json['getseeker']),
      getanotherseeker: json['getanotherseeker'] != null ? SeekerProfile.fromJson(json['getanotherseeker']) : null,
    );
  }
}

class MakerProfile {
  var id;
  var name;
  var email;
 var phone;
 var dob;
 var gender;
 var location;
 var profileImg;
 var profileVideo;
 var experience;
 var aboutMaker;
 var expectation;
 var headingOfMaker;
  var status;
  var currentStep;
 var imgPath;
 var videoPath;

  MakerProfile({
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

  factory MakerProfile.fromJson(Map<String, dynamic> json) {
    return MakerProfile(
      id: json['id'],
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
      status: json['status'],
      currentStep: json['current_step'],
      imgPath: json['img_path'],
      videoPath: json['video_path'],
    );
  }
}

class SeekerProfile {
  int ?id;
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
 var imgPath;
 var videoPath;
 var occupationName;
  var likeStatus;
  Details? details;

  SeekerProfile({
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
    this.imgPath,
    this.videoPath,
    this.occupationName,
    this.likeStatus,
    this.details,
  });

  factory SeekerProfile.fromJson(Map<String, dynamic> json) {
    return SeekerProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      occupation: json['occupation'],
      salary: json['salary'],
      address: json['address'],
      height: json['height'],
      dob: json['dob'],
      gender: json['gender'],
      religion: json['religion'],
      currentStep: json['current_step'],
      imgPath: json['img_path'],
      videoPath: json['video_path'],
      occupationName: json['occupation_name'],
      likeStatus: json['like_status'],
      details: json['details'] != null ? Details.fromJson(json['details']) : null,
    );
  }
}

class Details {
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
  List<String>? galleryPath;
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
    this.galleryPath,
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
      galleryPath: (json['gallary_path'] as List<dynamic>).cast<String>(),
      interestName: (json['interest_name'] as List<dynamic>)
          .map((interestNameJson) => InterestName.fromJson(interestNameJson))
          .toList(),
    );
  }
}

class InterestName {
  var title;

  InterestName({ this.title});

  factory InterestName.fromJson(Map<String, dynamic> json) {
    return InterestName(title: json['title']);
  }
}
