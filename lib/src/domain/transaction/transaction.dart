import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required String city,
    required String status,
    @JsonKey(name: 'tracking_number') required String? trackingNumber,
    @JsonKey(name: 'total_pay') required int totalPay,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json) =>
      _$TransactionFromJson(json);
}
