class LoginModel {
  final bool status;
  final String message;
  final DataModel? data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] != null ? DataModel.fromJson(json["data"]) : null,
    );
  }
}

class DataModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"],
      token: json["token"],
    );
  }
}
