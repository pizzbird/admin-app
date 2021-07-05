import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  @JsonSerializable(explicitToJson: true)
  factory Address({
    required String address,
    required double longitude,
    required double latitude,
    String? flor,
    String? flat,
    String? entryphone,
    String? comments,
    int? createdAt,
    int? updatedAt,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

typedef Addresses = List<Address>;
