
class SearchModel {
    bool status;
    dynamic message;
    Data data;

    SearchModel({
        required this.status,
        this.message,
        required this.data,
    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );


}

class Data {
    int currentPage;
    List<Datum> data;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    Data({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        this.nextPageUrl,
        required this.path,
        required this.perPage,
        this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

}

class Datum {
    int id;
    double price;
    String image;
    String name;
    String description;
    List<String> images;
    bool inFavorites;
    bool inCart;

    Datum({
        required this.id,
        required this.price,
        required this.image,
        required this.name,
        required this.description,
        required this.images,
        required this.inFavorites,
        required this.inCart,
    });

   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    price: json["price"].toDouble(), 
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
);


  
}
