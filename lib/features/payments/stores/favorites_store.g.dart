// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStore, Store {
  Computed<List<Payment>>? _$favoritesComputed;

  @override
  List<Payment> get favorites =>
      (_$favoritesComputed ??= Computed<List<Payment>>(
        () => super.favorites,
        name: '_FavoritesStore.favorites',
      )).value;

  late final _$_FavoritesStoreActionController = ActionController(
    name: '_FavoritesStore',
    context: context,
  );

  @override
  void toggleFavorite(Payment payment) {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
      name: '_FavoritesStore.toggleFavorite',
    );
    try {
      return super.toggleFavorite(payment);
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
