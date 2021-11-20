class Food {
  final String name;
  final String price;
  final String imageLink;
  final String ratings;

  Food(this.name, this.price, this.imageLink, this.ratings);
}

var mockFood = [
  Food("Chapati", "20", "assets/images/chapati.png", "4.9"),
  Food("Poori", "10", "assets/images/poori.png", "4.1"),
  Food("Roti", "15", "assets/images/roti.png", "4.5"),
  Food("Paneer", "50", "assets/images/paneer_chapati.png", "5.0"),
  Food("Aloo parotta", "30", "assets/images/chapati.png", "5.0"),
  Food("Chapati", "20", "assets/images/chapati.png", "4.9"),
];
