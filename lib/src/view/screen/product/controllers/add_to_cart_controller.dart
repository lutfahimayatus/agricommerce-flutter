import 'package:e_commerce_flutter/src/data/cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_to_cart_controller.g.dart';

@riverpod
class AddToCartController extends _$AddToCartController {
  @override
  FutureOr<void> build() {}

  Future<void> submit(int productId) async {
    final cartRepository = ref.watch(cartRepositoryProvider);
    try {
      state = const AsyncLoading();
      await cartRepository.addProductToCart(productId);
      ref.invalidate(cartProvider);
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(
          'Terjadi kesalahan saat menambahkan produk ke keranjang',
          StackTrace.current);
    }
  }
}
