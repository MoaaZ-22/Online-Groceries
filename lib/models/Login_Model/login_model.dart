
class LoginModel {
  String? status;
  String? errNum;
  String? msg;
  LoginUser? user;

  LoginModel({this.status, this.errNum, this.msg, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    user = json['user'] != null ? LoginUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['errNum'] = errNum;
    data['msg'] = msg;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class LoginUser {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? token;

  LoginUser(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.token});

  LoginUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    return data;
  }
}
