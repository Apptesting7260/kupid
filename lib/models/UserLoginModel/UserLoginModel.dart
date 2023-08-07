class UserLoginModel {
  UserLoginModel({
     this.status,
     this.message,
     this.token,
     this.currentStep,
  });
   String ?status;
   String ?message;
   String ?token;
   int ?currentStep;
  
  UserLoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    token = json['token'];
    currentStep = json['current_step'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;
    _data['current_step'] = currentStep;
    return _data;
  }
}