// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartRepositoryHash() => r'0b2cc8b81377cad46ba8bf207c71b6e8a231d937';

/// See also [cartRepository].
@ProviderFor(cartRepository)
final cartRepositoryProvider = Provider<CartRepository>.internal(
  cartRepository,
  name: r'cartRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartRepositoryRef = ProviderRef<CartRepository>;
String _$cartHash() => r'c6e62c199bb0eea04f82548c2ac70778bed51979';

/// See also [cart].
@ProviderFor(cart)
final cartProvider = FutureProvider<List<CartItem>>.internal(
  cart,
  name: r'cartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartRef = FutureProviderRef<List<CartItem>>;
String _$cartTotalHash() => r'eeae3b84cf77ea7ea39e2c4549efdf6e2e9d0c6d';

/// See also [cartTotal].
@ProviderFor(cartTotal)
final cartTotalProvider = Provider<int>.internal(
  cartTotal,
  name: r'cartTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartTotalRef = ProviderRef<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
