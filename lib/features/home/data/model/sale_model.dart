class SaleModel {
  int id;
  String title;
  double price;
  String description;
  String image;
  Rating rating;

  SaleModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) => SaleModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );
}

class Rating {
  double rate;
  int count;
  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );
}
