class MagicprofilesModel {
  MagicprofilesModel({
     this.status,
     this.requests,
  });
   String? status;
   List<Requests>? requests;
  
  MagicprofilesModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    requests = List.from(json['requests']).map((e)=>Requests.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['requests'] = requests!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Requests {
  Requests({
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
     this.imgPath,
     this.videoPath,
  });
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
   String? imgPath;
   String ?videoPath;
  
  Requests.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    occupation = json['occupation'];
    salary = json['salary'];
    address = json['address'];
    height = json['height'];
    dob = json['dob'];
    profileImg = json['profileImg'];
    profileVideo = json['profileVideo'];
    gender = json['gender'];
    religion = json['religion'];
    status = json['status'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
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
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    return _data;
  }
}