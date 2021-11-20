import 'package:zerosandones/core/models/mock_ingredients.dart';

class Food {
  final String name;
  final String price;
  final String imageLink;
  final String ratings;
  final List<Ingredients> ingredients;

  Food(this.name, this.price, this.imageLink, this.ratings, this.ingredients);
}

var mockFood = [
  Food(
    "Chapati",
    "20",
    "assets/images/chapati.png",
    "4.9",
    [
      Ingredients("Salt", "8 grams", "1.2%% "),
      Ingredients("Fat", "10 grams", " 16% "),
      Ingredients("Energy", "278 Kcal", " 46% "),
      Ingredients("Proteins", "9 grams", " 4% "),
      Ingredients("Sugar", "2 grams", " 0.3% "),
    ],
  ),
  Food(
    "Poori",
    "10",
    "assets/images/poori.png",
    "4.1",
    [
      Ingredients("Salt", "8 grams", " 1.2% "),
      Ingredients("Fat", "29 grams", " 25% "),
      Ingredients("Energy", "390 Kcal", " 60% "),
      Ingredients("Proteins", "9 grams", " 4% "),
      Ingredients("Sugar", "2 grams", " 0.3% "),
    ],
  ),
  Food(
    "Roti",
    "15",
    "assets/images/roti.png",
    "4.5",
    [
      Ingredients("Salt", "8 grams", " 1.2% "),
      Ingredients("Fat", "10 grams", " 16% "),
      Ingredients("Energy", "278 Kcal", " 46% "),
      Ingredients("Proteins", "9 grams", " 4% "),
      Ingredients("Sugar", "2 grams", " 0.3% "),
    ],
  ),
  Food(
    "Paneer",
    "50",
    "assets/images/paneer_chapati.png",
    "5.0",
    [
      Ingredients("Salt", "8 grams", " 1.2% "),
      Ingredients("Fat", "17 grams", " 30% "),
      Ingredients("Energy", "520 Kcal", " 55% "),
      Ingredients("Proteins", "9 grams", " 4% "),
      Ingredients("Sugar", "2 grams", " 0.3% "),
    ],
  ),
  Food(
    "Aloo parotta",
    "30",
    "assets/images/chapati.png",
    "5.0",
    [
      Ingredients("Salt", "8 grams", " 1.2% "),
      Ingredients("Fat", "10 grams", " 16% "),
      Ingredients("Energy", "278 Kcal", " 46% "),
      Ingredients("Proteins", "9 grams", " 4% "),
      Ingredients("Sugar", "2 grams", " 0.3% "),
    ],
  ),
  Food(
    "Chapati",
    "20",
    "assets/images/chapati.png",
    "4.9",
    [
      Ingredients("Salt", "8 grams", " 1.2% "),
      Ingredients("Fat", "10 grams", " 16% "),
      Ingredients("Energy", "278 Kcal", " 46% "),
      Ingredients("Proteins", "9 grams", " 4% "),
      Ingredients("Sugar", "2 grams", " 0.3% "),
    ],
  ),
];
