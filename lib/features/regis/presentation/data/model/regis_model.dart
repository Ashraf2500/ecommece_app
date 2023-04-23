



class RegisModel {
  final bool status ;
  final String message;
final UserData? data;
  RegisModel({required this.status, required this.message, this.data});


 factory RegisModel.fromJson(json){
    return RegisModel(
      message: json["message"],
      status: json["status"],
      data: json["data"] != null ? UserData.fromJson(json["data"]) : null,
    );
}

}

class UserData {
  final String name;
  final String phone; 
  final String email;
  final int id;
  final String image;
  final String token;

  UserData({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  factory UserData.fromJson(json) {
    return UserData(
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      id: json["id"],
      image: json["image"],
      token: json["token"],
    );
  }
}

