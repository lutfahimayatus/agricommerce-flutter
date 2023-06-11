import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/src/domain/cart/cart_item.dart';
import 'package:e_commerce_flutter/src/network/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

class CartRepository {
  CartRepository(this.client);

  Dio client;

  Future<List<CartItem>> getCart() async {
    final res = await client.get('/api/cart');
    return List.from(
      res.data['data'].map(
        (i) => CartItem.fromJson(i),
      ),
    );
  }

  Future<void> addProductToCart(int productId) async {
    await client.post('/api/products/$productId/cart');
  }

  Future<void> increaseQty(int id) async {
    await client.post('/api/cart/$id/increase');
  }

  Future<void> decreaseQty(int id) async {
    await client.post('/api/cart/$id/decrease');
  }

  Future<void> checkout({
    required String address,
    required int shippingCostId,
  }) async {
    await client.post('/api/cart/checkout', data: {
      'address': address,
      'shipping_cost_id': shippingCostId,
    });
  }
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(CartRepositoryRef ref) {
  final client = ref.watch(clientProvider);
  return CartRepository(client);
}

@Riverpod(keepAlive: true)
Future<List<CartItem>> cart(CartRef ref) {
  final cartRepository = ref.watch(cartRepositoryProvider);
  return cartRepository.getCart();
}

@Riverpod(keepAlive: true)
int cartTotal(CartTotalRef ref) {
  final cart = ref.watch(cartProvider);

  int total = 0;

  cart.valueOrNull?.forEach((item) {
    total += item.total;
  });

  return total;
}
