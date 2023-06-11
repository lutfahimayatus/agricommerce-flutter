import 'package:e_commerce_flutter/core/extensions.dart';
import 'package:e_commerce_flutter/src/data/cart_repository.dart';
import 'package:e_commerce_flutter/src/domain/cart/cart_item.dart';
import 'package:e_commerce_flutter/src/view/screen/cart/controllers/qty_controller.dart';
import 'package:e_commerce_flutter/src/view/screen/cart/empty_cart.dart';
import 'package:e_commerce_flutter/src/view/screen/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: _appBar(context),
      body: cart.when(
        data: (cart) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: cart.isNotEmpty ? cartList(cart, ref) : const EmptyCart(),
            ),
            bottomBarTitle(cartTotal),
            cart.isNotEmpty ? bottomBarButton(context) : Container()
          ],
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Keranjang",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Widget cartList(List<CartItem> items, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: items.mapWithIndex((index, _) {
          final item = items[index];
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[200]?.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorExtension.randomColor,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.network(
                          item.picture,
                          width: 100,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.price.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        splashRadius: 10.0,
                        onPressed: () {
                          ref
                              .read(qtyControllerProvider.notifier)
                              .decrease(item.id);
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xFFEC6813),
                        ),
                      ),
                      Text(
                        item.qty.toString(),
                        key: ValueKey<int>(
                          item.id,
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        splashRadius: 10.0,
                        onPressed: () {
                          ref
                              .read(qtyControllerProvider.notifier)
                              .increase(item.id);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFFEC6813),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget bottomBarTitle(int cartTotal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          Text(
            cartTotal.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: Color(0xFFEC6813),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: FilledButton(
          style: FilledButton.styleFrom(padding: const EdgeInsets.all(20)),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const CheckoutScreen(),
              ),
            );
          },
          child: const Text("Beli Sekarang"),
        ),
      ),
    );
  }
}
