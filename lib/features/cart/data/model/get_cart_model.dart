class GetCartModel {
  bool status;
  dynamic message;
  Data data;

  GetCartModel({
    required this.status,
    this.message,
    required this.data,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      status: json["status"],
      message: json["message"],
      data: Data.fromJson(json["data"]),
    );
  }
}

class Data {
  List<CartItem> cartItems;
  int subTotal;
  int total;

  Data({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      cartItems: List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x))),
      subTotal: json["sub_total"]?.toInt() ?? 0,
      total: json["total"]?.toInt() ?? 0,
    );
  }
}

class CartItem {
  int id;
  int quantity;
  Product product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json["id"],
      quantity: json["quantity"],
      product: Product.fromJson(json["product"]),
    );
  }
}

class Product {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      price: json["price"]?.toDouble() ?? 0.0,
      oldPrice: json["old_price"]?.toDouble() ?? 0.0,
      discount: json["discount"]?.toDouble() ?? 0.0,
      image: json["image"],
      name: json["name"],
      description: json["description"],
      images: List<String>.from(json["images"].map((x) => x)),
      inFavorites: json["in_favorites"],
      inCart: json["in_cart"],
    );
  }
}
