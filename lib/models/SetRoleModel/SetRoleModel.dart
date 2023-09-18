class SetRoleModel {
  SetRoleModel({
     this.status,
     this.msg,
     this.token,
  });
   String ?status;
   String? msg;
   String ?token;

  SetRoleModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = msg;
    _data['token'] = token;
    return _data;
  }
}