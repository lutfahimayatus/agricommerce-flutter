import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_cost.freezed.dart';
part 'shipping_cost.g.dart';

@freezed
class ShippingCost with _$ShippingCost {
  const factory ShippingCost({
    required int id,
    required String province,
    required String city,
    required int cost,
  }) = _ShippingCost;

  factory ShippingCost.fromJson(Map<String, Object?> json) =>
      _$ShippingCostFromJson(json);
}
