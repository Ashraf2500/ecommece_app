class SelectFavoritModel {
  bool status;
  String message;

  SelectFavoritModel({required this.status, required this.message});

  factory SelectFavoritModel.fromJson(Map<String, dynamic> json) {
    return SelectFavoritModel(
      status: json["status"],
      message: json["message"],
    );
  }
}
