import 'package:e_commerce_flutter/src/data/transaction_repository.dart';
import 'package:e_commerce_flutter/src/view/screen/transaction_detail/transaction_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionScreen extends ConsumerWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Pesanan",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: transactions.when(
          data: (transactions) => SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          TransactionDetailScreen(transactions[index]),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(transactions[index].city),
                  subtitle:
                      Text('Rp ${transactions[index].totalPay.toString()}'),
                  trailing: const Icon(Icons.arrow_right),
                ),
              ),
              itemCount: transactions.length,
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
}
