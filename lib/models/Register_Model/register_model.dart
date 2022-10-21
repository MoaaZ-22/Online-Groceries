class RegisterModel {
  String? message;
  RegisterUser? user;

  RegisterModel({this.message, this.user});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? RegisterUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class RegisterUser {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  RegisterUser({this.name, this.email, this.updatedAt, this.createdAt, this.id});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
