import 'package:admin_app/models/address.dart';
import 'package:admin_app/models/cart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  factory User({
    required Addresses addresses,
    Cart? cart,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
