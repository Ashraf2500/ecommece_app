class Banners {
    Banners({
        required this.id,
        required this.image,
        this.category,
        this.product,
    });

    int id;
    String image;
    dynamic category;
    dynamic product;

    factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json["id"],
        image: json["image"],
        category: json["category"] ,
        product: json["product"],
    );
}



