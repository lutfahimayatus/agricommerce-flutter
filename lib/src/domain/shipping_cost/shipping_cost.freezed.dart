// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_cost.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShippingCost _$ShippingCostFromJson(Map<String, dynamic> json) {
  return _ShippingCost.fromJson(json);
}

/// @nodoc
mixin _$ShippingCost {
  int get id => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  int get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShippingCostCopyWith<ShippingCost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingCostCopyWith<$Res> {
  factory $ShippingCostCopyWith(
          ShippingCost value, $Res Function(ShippingCost) then) =
      _$ShippingCostCopyWithImpl<$Res, ShippingCost>;
  @useResult
  $Res call({int id, String province, String city, int cost});
}

/// @nodoc
class _$ShippingCostCopyWithImpl<$Res, $Val extends ShippingCost>
    implements $ShippingCostCopyWith<$Res> {
  _$ShippingCostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? province = null,
    Object? city = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShippingCostCopyWith<$Res>
    implements $ShippingCostCopyWith<$Res> {
  factory _$$_ShippingCostCopyWith(
          _$_ShippingCost value, $Res Function(_$_ShippingCost) then) =
      __$$_ShippingCostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String province, String city, int cost});
}

/// @nodoc
class __$$_ShippingCostCopyWithImpl<$Res>
    extends _$ShippingCostCopyWithImpl<$Res, _$_ShippingCost>
    implements _$$_ShippingCostCopyWith<$Res> {
  __$$_ShippingCostCopyWithImpl(
      _$_ShippingCost _value, $Res Function(_$_ShippingCost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? province = null,
    Object? city = null,
    Object? cost = null,
  }) {
    return _then(_$_ShippingCost(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShippingCost implements _ShippingCost {
  const _$_ShippingCost(
      {required this.id,
      required this.province,
      required this.city,
      required this.cost});

  factory _$_ShippingCost.fromJson(Map<String, dynamic> json) =>
      _$$_ShippingCostFromJson(json);

  @override
  final int id;
  @override
  final String province;
  @override
  final String city;
  @override
  final int cost;

  @override
  String toString() {
    return 'ShippingCost(id: $id, province: $province, city: $city, cost: $cost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShippingCost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, province, city, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShippingCostCopyWith<_$_ShippingCost> get copyWith =>
      __$$_ShippingCostCopyWithImpl<_$_ShippingCost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShippingCostToJson(
      this,
    );
  }
}

abstract class _ShippingCost implements ShippingCost {
  const factory _ShippingCost(
      {required final int id,
      required final String province,
      required final String city,
      required final int cost}) = _$_ShippingCost;

  factory _ShippingCost.fromJson(Map<String, dynamic> json) =
      _$_ShippingCost.fromJson;

  @override
  int get id;
  @override
  String get province;
  @override
  String get city;
  @override
  int get cost;
  @override
  @JsonKey(ignore: true)
  _$$_ShippingCostCopyWith<_$_ShippingCost> get copyWith =>
      throw _privateConstructorUsedError;
}
