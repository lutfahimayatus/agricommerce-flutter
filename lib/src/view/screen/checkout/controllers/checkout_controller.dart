import 'package:e_commerce_flutter/src/data/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkout_controller.g.dart';

@riverpod
class CheckoutController extends _$CheckoutController {
  @override
  FutureOr<void> build() {}

  Future<void> submit(
      {required String address, required int shippingCostId}) async {
    final cartRepository = ref.watch(cartRepositoryProvider);
    try {
      state = const AsyncLoading();
      await cartRepository.checkout(
        address: address,
        shippingCostId: shippingCostId,
      );
      ref.invalidate(cartProvider);
      state = const AsyncData(null);
    } catch (e) {
      debugPrint(e.toString());
      state = AsyncError('Terjadi kesalahan saat checkout', StackTrace.current);
    }
  }
}
