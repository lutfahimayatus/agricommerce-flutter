// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_cost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShippingCost _$$_ShippingCostFromJson(Map<String, dynamic> json) =>
    _$_ShippingCost(
      id: json['id'] as int,
      province: json['province'] as String,
      city: json['city'] as String,
      cost: json['cost'] as int,
    );

Map<String, dynamic> _$$_ShippingCostToJson(_$_ShippingCost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province': instance.province,
      'city': instance.city,
      'cost': instance.cost,
    };
