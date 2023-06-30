class PostCartModel {
  bool status;
  String message;
  Data data;

  PostCartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PostCartModel.fromJson(Map<String, dynamic> json) => PostCartModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int id;
  int quantity;
  Product product;

  Data({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
      );
}

class Product {
  int id;
  var price;
  var oldPrice;
  var discount;
  String image;
  String name;
  String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

factory Product.fromJson(Map<String, dynamic> json) => Product(
  id: json["id"],
  price: json["price"],
  oldPrice: json["old_price"],
  discount: json["discount"],
  image: json["image"] ?? "", // Handle null value with empty string
  name: json["name"] ?? "", // Handle null value with empty string
  description: json["description"] ?? "", // Handle null value with empty string
);

}
