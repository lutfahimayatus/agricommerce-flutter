import 'package:e_commerce_flutter/src/data/cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qty_controller.g.dart';

@riverpod
class QtyController extends _$QtyController {
  @override
  FutureOr<void> build() {}

  Future<void> increase(int id) async {
    final cartRepository = ref.watch(cartRepositoryProvider);
    try {
      state = const AsyncLoading();
      await cartRepository.increaseQty(id);
      ref.invalidate(cartProvider);
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(
          'Terjadi kesalahan menambah qty barang', StackTrace.current);
    }
  }

  Future<void> decrease(int id) async {
    final cartRepository = ref.watch(cartRepositoryProvider);
    try {
      state = const AsyncLoading();
      await cartRepository.decreaseQty(id);
      ref.invalidate(cartProvider);
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(
          'Terjadi kesalahan mengurangi qty barang', StackTrace.current);
    }
  }
}
