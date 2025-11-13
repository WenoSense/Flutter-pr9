// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentsListStore on _PaymentsListStore, Store {
  Computed<List<Payment>>? _$sortedPaymentsComputed;

  @override
  List<Payment> get sortedPayments =>
      (_$sortedPaymentsComputed ??= Computed<List<Payment>>(
        () => super.sortedPayments,
        name: '_PaymentsListStore.sortedPayments',
      )).value;
  Computed<List<Payment>>? _$filteredPaymentsComputed;

  @override
  List<Payment> get filteredPayments =>
      (_$filteredPaymentsComputed ??= Computed<List<Payment>>(
        () => super.filteredPayments,
        name: '_PaymentsListStore.filteredPayments',
      )).value;
  Computed<List<Payment>>? _$favoritesComputed;

  @override
  List<Payment> get favorites =>
      (_$favoritesComputed ??= Computed<List<Payment>>(
        () => super.favorites,
        name: '_PaymentsListStore.favorites',
      )).value;

  late final _$paymentsAtom = Atom(
    name: '_PaymentsListStore.payments',
    context: context,
  );

  @override
  ObservableList<Payment> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(ObservableList<Payment> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  late final _$sortOptionAtom = Atom(
    name: '_PaymentsListStore.sortOption',
    context: context,
  );

  @override
  SortOption get sortOption {
    _$sortOptionAtom.reportRead();
    return super.sortOption;
  }

  @override
  set sortOption(SortOption value) {
    _$sortOptionAtom.reportWrite(value, super.sortOption, () {
      super.sortOption = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_PaymentsListStore.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$filterCategoryAtom = Atom(
    name: '_PaymentsListStore.filterCategory',
    context: context,
  );

  @override
  String get filterCategory {
    _$filterCategoryAtom.reportRead();
    return super.filterCategory;
  }

  @override
  set filterCategory(String value) {
    _$filterCategoryAtom.reportWrite(value, super.filterCategory, () {
      super.filterCategory = value;
    });
  }

  late final _$_PaymentsListStoreActionController = ActionController(
    name: '_PaymentsListStore',
    context: context,
  );

  @override
  void setSortOption(SortOption value) {
    final _$actionInfo = _$_PaymentsListStoreActionController.startAction(
      name: '_PaymentsListStore.setSortOption',
    );
    try {
      return super.setSortOption(value);
    } finally {
      _$_PaymentsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_PaymentsListStoreActionController.startAction(
      name: '_PaymentsListStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_PaymentsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterCategory(String value) {
    final _$actionInfo = _$_PaymentsListStoreActionController.startAction(
      name: '_PaymentsListStore.setFilterCategory',
    );
    try {
      return super.setFilterCategory(value);
    } finally {
      _$_PaymentsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPayment(Payment payment) {
    final _$actionInfo = _$_PaymentsListStoreActionController.startAction(
      name: '_PaymentsListStore.addPayment',
    );
    try {
      return super.addPayment(payment);
    } finally {
      _$_PaymentsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deletePayment(String id) {
    final _$actionInfo = _$_PaymentsListStoreActionController.startAction(
      name: '_PaymentsListStore.deletePayment',
    );
    try {
      return super.deletePayment(id);
    } finally {
      _$_PaymentsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAsPaid(String id) {
    final _$actionInfo = _$_PaymentsListStoreActionController.startAction(
      name: '_PaymentsListStore.markAsPaid',
    );
    try {
      return super.markAsPaid(id);
    } finally {
      _$_PaymentsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavorite(Payment payment) {
    final _$actionInfo = _$_PaymentsListStoreActionController.startAction(
      name: '_PaymentsListStore.toggleFavorite',
    );
    try {
      return super.toggleFavorite(payment);
    } finally {
      _$_PaymentsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payments: ${payments},
sortOption: ${sortOption},
searchQuery: ${searchQuery},
filterCategory: ${filterCategory},
sortedPayments: ${sortedPayments},
filteredPayments: ${filteredPayments},
favorites: ${favorites}
    ''';
  }
}
