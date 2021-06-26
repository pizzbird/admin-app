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
  }) = PizzaSizeData;
  factory PizzaSize.fromJson(Map<String, dynamic> json) =>
      _$PizzaSizeFromJson(json);
}

typedef Toppings = List<Topping>;
typedef PizzaSizes = List<PizzaSize>;
typedef PizzaStructure = Map<String, String>;

class AttrCartItem<T> {
  T attr;
  int count;
  AttrCartItem({required this.attr, required this.count});
}

@freezed
class SinglePizza with _$SinglePizza {
  const SinglePizza._(); // Added constructor

  @JsonSerializable(explicitToJson: true)
  const factory SinglePizza({
    required String uuid,
    required String title,
    required PizzaSizes sizes,
    PizzaStructure? structure,
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
      var _defaultSize =
          sizes.firstOrNull ?? const PizzaSize(name: "", price: 0);
      price += _defaultSize.price * count;
    }
    return price;
  }
}
