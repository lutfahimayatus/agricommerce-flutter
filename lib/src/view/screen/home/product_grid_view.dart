import 'package:e_commerce_flutter/src/data/product_repository.dart';
import 'package:e_commerce_flutter/src/domain/product/product.dart';
import 'package:e_commerce_flutter/src/utils/money_format.dart';
import 'package:e_commerce_flutter/src/view/screen/product/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductGridView extends ConsumerStatefulWidget {
  const ProductGridView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends ConsumerState<ProductGridView> {
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ref.read(productListProvider(page: pageKey).future);
      final isLastPage = newItems.links.next == null;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.data);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems.data, nextPageKey);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: PagedGridView<int, Product>(
        pagingController: _pagingController,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 10 / 16,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        builderDelegate:
            PagedChildBuilderDelegate(itemBuilder: (context, item, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(item.id),
                ),
              );
            },
            child: GridTile(
              footer: _gridItemFooter(item, context),
              child: _gridItemBody(item),
            ),
          );
        }),
      ),
    );
  }

  Widget _gridItemBody(Product product) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 188, 204, 133), //warna box product
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(product.picture, fit: BoxFit.cover),
    );
  }

  Widget _gridItemFooter(Product product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 225, 212, 212), //warna box harga
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 64, 0, 0), //warna tulisan
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  formatMoney(product.price),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 3),
              ],
            )
          ],
        ),
      ),
    );
  }
}
