class ForgotPasswordModel {
  ForgotPasswordModel({
     this.status,
     this.msg,
     this.otp,
  });
   String ?status;
   String ?msg;
   int ?otp;

  ForgotPasswordModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['otp'] = otp;
    return _data;
  }
}