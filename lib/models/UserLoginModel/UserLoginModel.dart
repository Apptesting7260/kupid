class UserLoginModel {
  UserLoginModel({
     this.status,
     this.message,
     this.token,
     this.tokenId,
     this.currentStep,
     this.userType,
  });
   String ?status;
   String ?message;
   String? token;
   int ?tokenId;
   int ?currentStep;
   String ?userType;
  
  UserLoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    token = json['token'];
    tokenId = json['token_id'];
    currentStep = json['current_step'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;
    _data['token_id'] = tokenId;
    _data['current_step'] = currentStep;
    _data['user_type'] = userType;
    return _data;
  }
}