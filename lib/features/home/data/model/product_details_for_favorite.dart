

class ProductDetailsForFavoritesModel {
  final bool status;
  dynamic message;
  Products  data;

  ProductDetailsForFavoritesModel(
      {required this.status, this.message, required this.data});

  factory ProductDetailsForFavoritesModel.fromJson(data) {
    return ProductDetailsForFavoritesModel(
      status: data["status"],
      message: data["message"],
      data: Products.fromJson(data["data"]),
    );
  }
}

class Products {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
 List<String> images;


  Products({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        price: (json["price"] as num).toDouble(),
        oldPrice: (json["old_price"] as num).toDouble(),
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
      );


}


