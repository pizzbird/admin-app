import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_pizza.freezed.dart';
part 'single_pizza.g.dart';

@freezed
class Topping with _$Topping {
  @JsonSerializable(explicitToJson: true)
  const factory Topping({
    required String name,
    required double price,
    required String uuid,
    String? srcImage,
  }) = ToppingData;

  factory Topping.fromJson(Map<String, dynamic> json) =>
      _$ToppingFromJson(json);
}

@freezed
class PizzaSize with _$PizzaSize {
  @JsonSerializable(explicitToJson: true)
  const factory PizzaSize({
    required String name,
    required double price,
    required String uuid,
    String? srcImage,
  }) = PizzaSizeData;
  factory PizzaSize.fromJson(Map<String, dynamic> json) =>
      _$PizzaSizeFromJson(json);
}

typedef Toppings = List<Topping>;
typedef PizzaSizes = List<PizzaSize>;
typedef Ingredients = List<Ingredient>;
typedef Doughs = List<Dough>;
typedef Boards = List<Board>;

class AttrCartItem<T> {
  T attr;
  int count;
  AttrCartItem({required this.attr, required this.count});
}

@freezed
class Dough with _$Dough {
  factory Dough({
    required String name,
    required String uuid,
  }) = _Dough;

  factory Dough.fromJson(Map<String, dynamic> json) => _$DoughFromJson(json);
}

@freezed
class Board with _$Board {
  factory Board({
    required String name,
    required String uuid,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  @JsonSerializable(explicitToJson: true)
  const factory Ingredient({
    required String name,
    required bool enabled,
    required String uuid,
    String? srcImage,
  }) = IngredientData;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

@freezed
class SinglePizza with _$SinglePizza {
  const SinglePizza._(); // Added constructor

  @JsonSerializable(explicitToJson: true)
  const factory SinglePizza({
    required String uuid,
    required String title,
    required PizzaSizes sizes,
    String? urlImage,
    Ingredients? ingredients,
    Doughs? doughs,
    Boards? boards,
    Toppings? toppings,
    String? description,
  }) = SinglePizzaData;

  factory SinglePizza.fromJson(Map<String, dynamic> json) =>
      _$SinglePizzaFromJson(json);

  double priceCalculator({
    required int count,
    List<AttrCartItem<Topping>>? toppingsList,
    PizzaSize? pizzaSize,
  }) {
    var price = 0.0;
    if (toppingsList != null) {
      for (var i = 0; i < toppingsList.length; i++) {
        price += toppingsList[i].attr.price * toppingsList[i].count;
      }
    }
    if (pizzaSize != null) {
      price += pizzaSize.price * count;
    } else {
      var _defaultSize = sizes.firstOrNull ??
          const PizzaSize(name: "", price: 0, uuid: 'none');
      price += _defaultSize.price * count;
    }
    return price;
  }
}
