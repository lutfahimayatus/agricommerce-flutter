import 'package:e_commerce_flutter/src/view/screen/home/product_grid_view.dart';
import 'package:flutter/material.dart';

enum AppbarActionType { leading, trailing }

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "Silahkan pilih produk yang ingin anda beli disini",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const ProductGridView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
