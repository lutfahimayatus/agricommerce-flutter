import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/src/domain/shipping_cost/shipping_cost.dart';
import 'package:e_commerce_flutter/src/network/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shipping_repository.g.dart';

class ShippingRepository {
  ShippingRepository(this.client);

  Dio client;

  Future<List<ShippingCost>> getShippingCost() async {
    final res = await client.get('/api/shipping-costs');

    return List.from(
      res.data['data'].map(
        (i) => ShippingCost.fromJson(i),
      ),
    );
  }
}

@riverpod
ShippingRepository shippingRepository(ShippingRepositoryRef ref) {
  final client = ref.watch(clientProvider);
  return ShippingRepository(client);
}

@riverpod
Future<List<ShippingCost>> shippingCosts(ShippingCostsRef ref) {
  final shippingRepository = ref.watch(shippingRepositoryProvider);
  return shippingRepository.getShippingCost();
}
