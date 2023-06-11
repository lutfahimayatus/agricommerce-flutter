import 'package:e_commerce_flutter/src/data/shipping_repository.dart';
import 'package:e_commerce_flutter/src/utils/async_ui.dart';
import 'package:e_commerce_flutter/src/view/screen/checkout/controllers/checkout_controller.dart';
import 'package:e_commerce_flutter/src/view/screen/checkout/state/selected_shipping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final shippingCost = ref.watch(shippingCostsProvider);
    final selectedShipping = ref.watch(selectedShippingProvider);

    final controller = ref.watch(checkoutControllerProvider);

    ref.listen(checkoutControllerProvider, (_, state) {
      state.showSnackbarOnError(context);

      if (!state.isLoading && !state.hasError) {
        Navigator.of(context).pop();
        state.showSnackbarOnSuccess(context, 'Pesanan anda berhasil diproses');
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: shippingCost.when(
          data: (shippingCost) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(hintText: 'Alamat'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: selectedShipping?.id,
                      isExpanded: true,
                      hint: const Text('Pilih ongkir'),
                      items: shippingCost
                          .map(
                            (el) => DropdownMenuItem(
                              value: el.id,
                              child: Text('${el.city} - Rp${el.cost}'),
                            ),
                          )
                          .toList(),
                      onChanged: (el) {
                        if (el != null) {
                          ref
                              .read(selectedShippingProvider.notifier)
                              .setShipping(el);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (selectedShipping != null) {
                          ref.read(checkoutControllerProvider.notifier).submit(
                                address: _addressController.text,
                                shippingCostId: selectedShipping.id,
                              );
                        }
                      },
                      child: controller.isLoading
                          ? const Center(
                              child: SizedBox.square(
                                dimension: 25.0,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3.0,
                                ),
                              ),
                            )
                          : const Text('Beli'),
                    ),
                  )
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => const Center(
            child: Text('Terjadi kesalahan saat mengambil data'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
