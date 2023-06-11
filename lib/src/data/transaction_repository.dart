import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/src/domain/transaction/transaction.dart';
import 'package:e_commerce_flutter/src/network/client.dart';
import 'package:http_parser/http_parser.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_repository.g.dart';

class TransactionRepository {
  TransactionRepository(this.client);

  Dio client;

  Future<List<Transaction>> getTransactions() async {
    final res = await client.get('/api/transactions');

    return List.from(
      res.data['data'].map(
        (i) => Transaction.fromJson(i),
      ),
    );
  }

  Future<void> uploadProof(int id, File picture) async {
    String fileName = picture.path.split('/').last;

    final data = FormData.fromMap({
      "proof_of_transaction": await MultipartFile.fromFile(
        picture.path,
        filename: fileName,
        contentType: MediaType(
          'image',
          path.extension(fileName),
        ),
      ),
    });
    await client.post('/api/transactions/$id', data: data);
  }
}

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  final client = ref.watch(clientProvider);
  return TransactionRepository(client);
}

@riverpod
Future<List<Transaction>> transactions(TransactionsRef ref) {
  final transactionRepository = ref.watch(transactionRepositoryProvider);
  return transactionRepository.getTransactions();
}
