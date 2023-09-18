class SignUpModel {
  SignUpModel({
     this.status,
     this.msg,
  });
   String ?status;
   String? msg;
  
  SignUpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = msg;
    return _data;
  }
}