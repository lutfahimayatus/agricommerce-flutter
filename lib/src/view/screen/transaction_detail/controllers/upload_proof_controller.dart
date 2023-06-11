import 'dart:io';

import 'package:e_commerce_flutter/src/data/transaction_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_proof_controller.g.dart';

@riverpod
class UploadProofController extends _$UploadProofController {
  final _imagePicker = ImagePicker();
  @override
  FutureOr<void> build() {}

  Future<bool> submit(int id) async {
    final transactionRepository = ref.watch(transactionRepositoryProvider);
    try {
      state = const AsyncLoading();
      final file = await _imagePicker.pickImage(source: ImageSource.camera);
      if (file == null) {
        state = const AsyncData(null);
        return false;
      }
      await transactionRepository.uploadProof(id, File(file.path));
      state = const AsyncData(null);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      state = AsyncError('Terjadi kesalahan saat menggungah bukti pembayaran',
          StackTrace.current);
      return false;
    }
  }
}
