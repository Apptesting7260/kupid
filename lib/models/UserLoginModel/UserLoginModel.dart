class UserLoginModel {
  UserLoginModel({
     this.status,
     this.message,
     this.token,
     this.currentStep,
     this.userType,
  });
  dynamic status;
 dynamic message;
 dynamic token;
   dynamic currentStep;
  dynamic userType;
  
  UserLoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    token = json['token'];
    currentStep = json['current_step'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;
    _data['current_step'] = currentStep;
    _data['user_type'] = userType;
    return _data;
  }
}