import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Topping with _$Topping {
  @JsonSerializable(explicitToJson: true)
  const factory Topping({
    required String name,
    required double price,
    required String uuid,
    String? srcImage,
    int? createdAt,
    int? updatedAt,
  }) = ToppingData;

  factory Topping.fromJson(Map<String, dynamic> json) =>
      _$ToppingFromJson(json);
}

@freezed
class ProductSize with _$ProductSize {
  @JsonSerializable(explicitToJson: true)
  const factory ProductSize({
    required String name,
    required double price,
    required String uuid,
    int? createdAt,
    int? updatedAt,
    String? srcImage,
  }) = ProductSizeData;
  factory ProductSize.fromJson(Map<String, dynamic> json) =>
      _$ProductSizeFromJson(json);
}

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
    int? createdAt,
    int? updatedAt,
  }) = _Dough;

  factory Dough.fromJson(Map<String, dynamic> json) => _$DoughFromJson(json);
}

@freezed
class Board with _$Board {
  factory Board({
    required String name,
    required String uuid,
    int? createdAt,
    int? updatedAt,
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
    int? createdAt,
    int? updatedAt,
    String? srcImage,
  }) = IngredientData;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

typedef Toppings = List<Topping>;
typedef ProductSizes = List<ProductSize>;
typedef Ingredients = List<Ingredient>;
typedef Doughs = List<Dough>;
typedef Boards = List<Board>;

@freezed
class Product with _$Product {
  const Product._();

  @JsonSerializable(explicitToJson: true)
  const factory Product.pizza({
    required String uuid,
    required String title,
    required ProductSizes sizes,
    String? categoryUuid,
    Map<String, String>? nutritionalValue,
    int? createdAt,
    int? updatedAt,
    String? urlImage,
    Ingredients? ingredients,
    Doughs? doughs,
    Boards? boards,
    Toppings? toppings,
    String? description,
  }) = Pizza;

  @JsonSerializable(explicitToJson: true)
  const factory Product.drink({
    required String uuid,
    required String title,
    required ProductSizes sizes,
  }) = Drink;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  double priceCalculator({
    required int count,
    List<AttrCartItem<Topping>>? toppingsList,
    ProductSize? pizzaSize,
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
          const ProductSize(name: "", price: 0, uuid: 'none');
      price += _defaultSize.price * count;
    }
    return price;
  }
}
