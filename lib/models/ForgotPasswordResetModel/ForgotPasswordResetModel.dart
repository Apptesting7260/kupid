class ForgotPasswordResetModel {
  ForgotPasswordResetModel({
     this.status,
     this.msg,
  });
   String? status;
  String ?msg;

  ForgotPasswordResetModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    return _data;
  }
}