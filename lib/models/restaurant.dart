import 'package:admin_app/models/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  @JsonSerializable(explicitToJson: true)
  const factory Restaurant({
    required String title,
    required Address address,
    List<SocialMedia>? socialMedia,
    String? description,
  }) = RestaurantData;
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@freezed
class SocialMedia with _$SocialMedia {
  @JsonSerializable(explicitToJson: true)
  const factory SocialMedia({required String url}) = SocialMediaData;
  factory SocialMedia.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaFromJson(json);
}

typedef Restaurants = List<Restaurant>;
