import 'package:zerosandones/core/models/mock_ingredients.dart';

class Food {
  final String name;
  final String price;
  final String imageLink;
  final String ratings;
  final Ingredients ingredients;

  Food(this.name, this.price, this.imageLink, this.ratings, this.ingredients);
}

var mockFood = [
  Food(
    "Chapati",
    "20",
    "assets/images/chapati.png",
    "4.9",
    Ingredients(
      Composition("8 grams", "%0.3"),
      Composition("140 Kcal", "%43"),
      Composition("20 grams", "%35"),
      Composition("10 grams", "%24"),
      Composition("5 grams", "%0.1"),
    ),
  ),
  Food(
    "Poori",
    "10",
    "assets/images/poori.png",
    "4.1",
    Ingredients(
      Composition("8 grams", "%0.3"),
      Composition("180 Kcal", "%43"),
      Composition("20 grams", "%35"),
      Composition("10 grams", "%24"),
      Composition("5 grams", "%0.1"),
    ),
  ),
  Food(
    "Roti",
    "15",
    "assets/images/roti.png",
    "4.5",
    Ingredients(
      Composition("8 grams", "%0.3"),
      Composition("100 Kcal", "%43"),
      Composition("20 grams", "%35"),
      Composition("10 grams", "%24"),
      Composition("5 grams", "%0.1"),
    ),
  ),
  Food(
    "Paneer",
    "50",
    "assets/images/paneer_chapati.png",
    "5.0",
    Ingredients(
      Composition("28 grams", "%0.3"),
      Composition("440 Kcal", "%43"),
      Composition("20 grams", "%35"),
      Composition("10 grams", "%24"),
      Composition("5 grams", "%0.1"),
    ),
  ),
  Food(
    "Aloo parotta",
    "30",
    "assets/images/chapati.png",
    "5.0",
    Ingredients(
      Composition("8 grams", "%0.3"),
      Composition("140 Kcal", "%43"),
      Composition("20 grams", "%35"),
      Composition("10 grams", "%24"),
      Composition("5 grams", "%0.1"),
    ),
  ),
  Food(
    "Chapati",
    "20",
    "assets/images/chapati.png",
    "4.9",
    Ingredients(
      Composition("8 grams", "%0.3"),
      Composition("140 Kcal", "%43"),
      Composition("20 grams", "%35"),
      Composition("10 grams", "%24"),
      Composition("5 grams", "%0.1"),
    ),
  ),
];
