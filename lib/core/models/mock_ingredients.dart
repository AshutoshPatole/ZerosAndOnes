class Ingredients {
  final Composition salt;
  final Composition energy;
  final Composition fat;
  final Composition proteins;
  final Composition sugar;

  Ingredients(this.salt, this.energy, this.fat, this.proteins, this.sugar);
}

class Composition {
  final String grams;
  final String percentage;

  Composition(this.grams, this.percentage);
}
