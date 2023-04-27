
class CategoryModel {
  bool status;
  CategoryData data;
  CategoryModel({
    required this.status,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(status: json["status"], data: CategoryData.fromJson(json["data"]));
  }
}

class CategoryData {
  int currentPage;
  List<DataModel> data;
  CategoryData({
    required this.currentPage,
    required this.data,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> response = json["data"];
        final List<DataModel> ListData =
    response.map((e) => DataModel.fromJson(e)).toList();

    return CategoryData(
      currentPage: json["current_page"],
      data: ListData,
    );
  }
}

class DataModel {
  int id;
  String name;
  String image;
  DataModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}
