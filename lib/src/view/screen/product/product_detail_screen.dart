import 'package:e_commerce_flutter/src/data/product_repository.dart';
import 'package:e_commerce_flutter/src/domain/product/product.dart';
import 'package:e_commerce_flutter/src/utils/async_ui.dart';
import 'package:e_commerce_flutter/src/utils/money_format.dart';
import 'package:e_commerce_flutter/src/view/screen/product/controllers/add_to_cart_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final productData = ref.watch(productProvider(id));

    final controller = ref.watch(addToCartControllerProvider);

    ref.listen(addToCartControllerProvider, (_, state) {
      state.showSnackbarOnError(context);

      state.showSnackbarOnSuccess(
          context, 'Produk berhasil ditambahkan ke keranjang');
    });

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: productData.when(
          data: (product) => SingleChildScrollView(
            child: PageWrapper(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productPageView(width, height, product),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              formatMoney(product.price),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "About",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 10),
                        if (product.description != null)
                          Text(product.description!),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              ref
                                  .read(addToCartControllerProvider.notifier)
                                  .submit(product.id);
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
                                : const Text("Tambah ke keranjang"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }

  Widget productPageView(double width, double height, Product product) {
    return SizedBox(
      height: height * 0.42,
      width: width,
      child: Image.network(
        product.picture,
        fit: BoxFit.cover,
      ),
    );
  }
}
