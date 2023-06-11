import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/src/domain/product/product.dart';
import 'package:e_commerce_flutter/src/network/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

class ProductRepository {
  ProductRepository(this.client);

  Dio client;

  Future<ProductList> getProductList({int page = 0}) async {
    final res = await client.get('/api/products?page=$page');

    return ProductList.fromJson(res.data);
  }

  Future<Product> getProductDetail(int id) async {
    final res = await client.get('/api/products/$id');
    return Product.fromJson(res.data['data']);
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final client = ref.watch(clientProvider);
  return ProductRepository(client);
}

@riverpod
Future<ProductList> productList(ProductListRef ref, {int page = 0}) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.getProductList(page: page);
}

@riverpod
Future<Product> product(ProductRef ref, int id) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.getProductDetail(id);
}
