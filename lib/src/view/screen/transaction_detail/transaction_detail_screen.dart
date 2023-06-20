import 'package:e_commerce_flutter/src/domain/transaction/transaction.dart';
import 'package:e_commerce_flutter/src/utils/async_ui.dart';
import 'package:e_commerce_flutter/src/utils/money_format.dart';
import 'package:e_commerce_flutter/src/view/screen/transaction_detail/controllers/upload_proof_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionDetailScreen extends ConsumerWidget {
  const TransactionDetailScreen(this.transaction, {super.key});

  final Transaction transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    ref.listen(uploadProofControllerProvider, (_, state) {
      state.showSnackbarOnError(context);
    });

    final controller = ref.watch(uploadProofControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Pesanan",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total Bayar'),
              Text(
                formatMoney(transaction.totalPay),
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Kota Pengiriman'),
              Text(
                transaction.city,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Status'),
              Text(
                transaction.status,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('No. Resi'),
              Text(
                transaction.trackingNumber ?? '-',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Nomor Rekening Pembayaran'),
              Text(
                'BRI: 089602577390',
                style: textTheme.headlineMedium,
              ),
              Text(
                'BCA: 089602577390',
                style: textTheme.headlineMedium,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    final successfullyUploaded = await ref
                        .read(uploadProofControllerProvider.notifier)
                        .submit(transaction.id);

                    if (successfullyUploaded) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text(
                                'Bukti pembayaran berhasil diunggah, silahkan tunggu pengiriman dari admin'),
                          ),
                        );
                      }
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
                      : const Text('Upload Bukti Transaksi'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
