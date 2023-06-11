import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductList with _$ProductList {
  const factory ProductList({
    required List<Product> data,
    required Link links,
  }) = _ProductList;

  factory ProductList.fromJson(Map<String, Object?> json) =>
      _$ProductListFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String picture,
    required int price,
    required String? description,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}

@freezed
class Link with _$Link {
  const factory Link({
    required String first,
    required String last,
    required String? prev,
    required String? next,
  }) = _Link;

  factory Link.fromJson(Map<String, Object?> json) => _$LinkFromJson(json);
}
