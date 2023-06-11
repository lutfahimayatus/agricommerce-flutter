import 'package:e_commerce_flutter/src/data/shipping_repository.dart';
import 'package:e_commerce_flutter/src/domain/shipping_cost/shipping_cost.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_shipping.g.dart';

@riverpod
class SelectedShipping extends _$SelectedShipping {
  @override
  ShippingCost? build() {
    return null;
  }

  void setShipping(int id) {
    final data = ref.watch(shippingCostsProvider);
    final shippingCost = data.value;
    final selected = shippingCost!.where((shipping) => shipping.id == id).first;
    state = selected;
  }
}
