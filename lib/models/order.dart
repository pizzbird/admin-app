import 'package:admin_app/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'address.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum OrderStatus {
  created,
  cooking,
  completed,
  canceled,
}

@freezed
class Order with _$Order {
  factory Order({
    required List<Product> products,
    required Address address,
    required String uuid,
    required OrderStatus status,
    int? createdAt,
    int? updatedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
