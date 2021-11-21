import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    required this.price,
    required this.name,
    required this.rating,
    required this.photo,
    required this.description,
    required this.id,
    required this.ingredients,
  });

  final String price;
  final String name;
  final double rating;
  final String photo;
  final String description;
  final String id;
  final List<Ingredient> ingredients;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        price: json["price"],
        name: json["name"],
        rating: json["rating"].toDouble(),
        photo: json["photo"],
        description: json["description"],
        id: json["id"],
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "name": name,
        "rating": rating,
        "photo": photo,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      };
}

class Ingredient {
  Ingredient({
    required this.percentage,
    required this.name,
    required this.grams,
  });

  final String percentage;
  final String name;
  final String grams;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        percentage: json["percentage"],
        name: json["name"],
        grams: json["grams"],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "name": name,
        "grams": grams,
      };
}
