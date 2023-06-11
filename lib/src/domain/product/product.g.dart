// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductList _$$_ProductListFromJson(Map<String, dynamic> json) =>
    _$_ProductList(
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: Link.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductListToJson(_$_ProductList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
    };

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as int,
      name: json['name'] as String,
      picture: json['picture'] as String,
      price: json['price'] as int,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'price': instance.price,
      'description': instance.description,
    };

_$_Link _$$_LinkFromJson(Map<String, dynamic> json) => _$_Link(
      first: json['first'] as String,
      last: json['last'] as String,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$_LinkToJson(_$_Link instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };
