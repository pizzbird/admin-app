import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotions.freezed.dart';
part 'promotions.g.dart';

// TODO: promotions
@freezed
class Promotions with _$Promotions {
  const factory Promotions() = _Promotions;

  factory Promotions.fromJson(Map<String, dynamic> json) =>
      _$PromotionsFromJson(json);
}
