class SpeendRequestModel {
  SpeendRequestModel({
     this.status,
     this.data,
  });
   String? status;
   List<Data>? data;
  
  SpeendRequestModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
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
     this.spinLeverpoolRequestedData,
  });
   int ?id;
   String? name;
   String ?email;
   String ?phone;
   String ?occupation;
   String ?salary;
   String ?address;
   String ?height;
   String ?dob;
   String ?gender;
   String ?religion;
   int? currentStep;
   String ?imgPath;
   String ?videoPath;
   String? occupationName;
   int ?likeStatus;
   SpinLeverpoolRequestedData ?spinLeverpoolRequestedData;
  
  Data.fromJson(Map<String, dynamic> json){
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
    spinLeverpoolRequestedData = SpinLeverpoolRequestedData.fromJson(json['spin_leverpool_requested_data']);
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
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['occupation_name'] = occupationName;
    _data['like_status'] = likeStatus;
    _data['spin_leverpool_requested_data'] = spinLeverpoolRequestedData!.toJson();
    return _data;
  }
}

class SpinLeverpoolRequestedData {
  SpinLeverpoolRequestedData({
     this.id,
     this.seekerId,
     this.spinRequestTime,
     this.showExpireTime,
     this.spinRequestData,
  });
   int ?id;
   int ?seekerId;
   String? spinRequestTime;
   String ?showExpireTime;
   List<SpinRequestData>? spinRequestData;
  
  SpinLeverpoolRequestedData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    seekerId = json['seeker_id'];
    spinRequestTime = json['spin_request_time'];
    showExpireTime = json['show_expire_Time'];
    spinRequestData = List.from(json['spin_request_data']).map((e)=>SpinRequestData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['seeker_id'] = seekerId;
    _data['spin_request_time'] = spinRequestTime;
    _data['show_expire_Time'] = showExpireTime;
    _data['spin_request_data'] = spinRequestData!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SpinRequestData {
  SpinRequestData({
     this.seekerData,
     this.isRequested,
  });
   SeekerData? seekerData;
   bool? isRequested;
  
  SpinRequestData.fromJson(Map<String, dynamic> json){
    seekerData = SeekerData.fromJson(json['seeker_data']);
    isRequested = json['is_requested'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['seeker_data'] = seekerData!.toJson();
    _data['is_requested'] = isRequested;
    return _data;
  }
}

class SeekerData {
  SeekerData({
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
     this.questions,
  });
   int ?id;
   String? name;
   String? email;
   String? phone;
   String? occupation;
   String? salary;
   String? address;
   String? height;
   String? dob;
   String ?gender;
   String ?religion;
   Null currentStep;
   String? imgPath;
   String? videoPath;
   String ?occupationName;
   int ?likeStatus;
   Questions? questions;
  
  SeekerData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    occupation = json['occupation'];
    salary = json['salary'];
    address = json['address'];
    height = json['height'];
    dob = null;
    gender = json['gender'];
    religion = json['religion'];
    currentStep = null;
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    occupationName = json['occupation_name'];
    likeStatus = json['like_status'];
    questions = Questions.fromJson(json['questions']);
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
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['occupation_name'] = occupationName;
    _data['like_status'] = likeStatus;
    _data['questions'] = questions!.toJson();
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
   int? id;
   int? seekerId;
   String? question;
   String ?firstAnswer;
   String? secondAnswer;
   String ?thirdAnswer;
   String ?correctAnswer;
   int ?status;
   String? createdAt;
   String? updatedAt;
  
  Questions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    seekerId = json['seeker_id'];
    question = json['question'];
    firstAnswer = json['first_answer'];
    secondAnswer = json['second_answer'];
    thirdAnswer = json['third_answer'];
    correctAnswer = json['correct_answer'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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