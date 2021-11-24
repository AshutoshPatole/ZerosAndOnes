import 'dart:convert';

List<CartItem> cartItemFromJson(String str) =>
    List<CartItem>.from(json.decode(str).map((x) => CartItem.fromJson(x)));

String cartItemToJson(List<CartItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItem {
  CartItem({
    required this.id,
    required this.itemId,
    required this.itemPhoto,
    required this.price,
    required this.quantity,
  });

  final String id;
  final String itemId;
  final String itemPhoto;
  final String price;
  final String quantity;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["_id"],
        itemId: json["itemId"],
        itemPhoto: json["itemPhoto"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itemId": itemId,
        "itemPhoto": itemPhoto,
        "price": price,
        "quantity": quantity,
      };
}
