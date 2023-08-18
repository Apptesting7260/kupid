class MagicprofilesModel {
  MagicprofilesModel({
     this.status,
     this.requests,
  });
   String ?status;
   List<Requests> ?requests;
  
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
     this.currentStep,
     this.imgPath,
     this.videoPath,
     this.questions,
  });
   int? id;
   String ?name;
   String ?email;
   String? phone;
   String? occupation;
   String? salary;
   String? address;
   String ?height;
   String? dob;
   String ?profileImg;
   String? profileVideo;
   String? gender;
   String? religion;
   int? currentStep;
   String ?imgPath;
   String ?videoPath;
   Questions? questions;
  
  Requests.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    occupation = null;
    salary = null;
    address = null;
    height = json['height'];
    dob = null;
    profileImg = json['profile_img'];
    profileVideo = null;
    gender = json['gender'];
    religion = null;
    currentStep = null;
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    questions = null;
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
    _data['questions'] = questions;
    return _data;
  }
}

class Questions {
  Questions({
     this.id,
     this.seekerId,
     this.question,
     this.firstAnswer,
     this.secondAnswer,
     this.thirdAnswer,
     this.correctAnswer,
     this.status,
     this.createdAt,
     this.updatedAt,
  });
   int ?id;
   int? seekerId;
   String? question;
   String? firstAnswer;
   String? secondAnswer;
   String? thirdAnswer;
   String? correctAnswer;
   int ?status;
   String? createdAt;
   String? updatedAt;
  
  Questions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    seekerId = json['seeker_id'];
    question = null;
    firstAnswer = null;
    secondAnswer = null;
    thirdAnswer = null;
    correctAnswer = null;
    status = json['status'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['seeker_id'] = seekerId;
    _data['question'] = question;
    _data['first_answer'] = firstAnswer;
    _data['second_answer'] = secondAnswer;
    _data['third_answer'] = thirdAnswer;
    _data['correct_answer'] = correctAnswer;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}