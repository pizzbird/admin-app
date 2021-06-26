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
    double? price,
  }) = PizzaSizeData;
  factory PizzaSize.fromJson(Map<String, dynamic> json) =>
      _$PizzaSizeFromJson(json);
}

typedef Toppings = List<Topping>;
typedef PizzaSizes = List<PizzaSize>;
typedef PizzaStructure = Map<String, String>;

@freezed
class SinglePizza with _$SinglePizza {
  @JsonSerializable(explicitToJson: true)
  const factory SinglePizza({
    required String uuid,
    required String title,
    required double price,
    required PizzaSizes sizes,
    PizzaStructure? structure,
    Toppings? toppings,
    String? description,
  }) = SinglePizzaData;

  factory SinglePizza.fromJson(Map<String, dynamic> json) =>
      _$SinglePizzaFromJson(json);

  double priceCalculator({
    required int count,
    List<int>? toppingsList,
  }) {
    var _toppings = 0.0;
    if (toppingsList != null) {}
    return _toppings + count;
  }
}
