// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as int,
      city: json['city'] as String,
      status: json['status'] as String,
      trackingNumber: json['tracking_number'] as String?,
      totalPay: json['total_pay'] as int,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'status': instance.status,
      'tracking_number': instance.trackingNumber,
      'total_pay': instance.totalPay,
    };
