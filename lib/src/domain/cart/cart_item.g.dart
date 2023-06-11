// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      id: json['id'] as int,
      product: json['product'] as String,
      price: json['price'] as int,
      picture: json['picture'] as String,
      qty: json['qty'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'price': instance.price,
      'picture': instance.picture,
      'qty': instance.qty,
      'total': instance.total,
    };
