class UserModel
{
  String? name;
  String? email;
  String? uId;
  String? image;

  UserModel({this.name, this.email, this.uId, this.image});

  UserModel.fromJason(Map<String, dynamic> jason)
  {
    name = jason['name'];
    email = jason['email'];
    uId = jason['uId'];
    image = jason['image'];
  }

  Map<String, dynamic> toMap()
  {
    return
        {
          'name' : name,
          'email': email,
          'uId'  : uId,
          'image'  : image,
        };
  }

}