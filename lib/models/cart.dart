import 'package:admin_app/models/address.dart';
import 'package:admin_app/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  factory Cart({
    required List<Product> products,
    required Address address,
    required String uuid,
    int? createdAt,
    int? updatedAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
