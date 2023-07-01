
class GetCartModel {
    bool status;
    String message;
    Data data;

    GetCartModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );


}

class Data {
    Cart cart;
    int subTotal;
    int total;

    Data({
        required this.cart,
        required this.subTotal,
        required this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        cart: Cart.fromJson(json["cart"]),
        subTotal: json["sub_total"],
        total: json["total"],
    );

}

class Cart {
    int id;
    int quantity;
    Product product;

    Cart({
        required this.id,
        required this.quantity,
        required this.product,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
    );

 
}

class Product {
    int id;
    int price;
    int oldPrice;
    int discount;
    String image;

    Product({
        required this.id,
        required this.price,
        required this.oldPrice,
        required this.discount,
        required this.image,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
    );


}
