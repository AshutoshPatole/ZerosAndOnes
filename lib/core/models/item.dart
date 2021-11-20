// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

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
    required this.description,
    required this.ingredients,
    required this.photo,
  });

  String price;
  String name;
  double rating;
  String description;
  Ingredients ingredients;
  String photo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        price: json["price"],
        name: json["name"],
        rating: json["rating"].toDouble(),
        description: json["description"],
        ingredients: Ingredients.fromJson(json["ingredients"]),
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "name": name,
        "rating": rating,
        "description": description,
        "ingredients": ingredients.toJson(),
        "photo": photo,
      };
}

class Ingredients {
  Ingredients({
    required this.salt,
    required this.protein,
    required this.fat,
    required this.sugar,
    required this.energy,
  });

  Energy salt;
  Energy protein;
  Energy fat;
  Energy sugar;
  Energy energy;

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        salt: Energy.fromJson(json["salt"]),
        protein: Energy.fromJson(json["protein"]),
        fat: Energy.fromJson(json["fat"]),
        sugar: Energy.fromJson(json["sugar"]),
        energy: Energy.fromJson(json["energy"]),
      );

  Map<String, dynamic> toJson() => {
        "salt": salt.toJson(),
        "protein": protein.toJson(),
        "fat": fat.toJson(),
        "sugar": sugar.toJson(),
        "energy": energy.toJson(),
      };
}

class Energy {
  Energy({
    required this.percentage,
    required this.grams,
  });

  String percentage;
  String grams;

  factory Energy.fromJson(Map<String, dynamic> json) => Energy(
        percentage: json["percentage"],
        grams: json["grams"],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "grams": grams,
      };
}
