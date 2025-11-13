// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentFormStore on _PaymentFormStore, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(
    () => super.isValid,
    name: '_PaymentFormStore.isValid',
  )).value;

  late final _$titleAtom = Atom(
    name: '_PaymentFormStore.title',
    context: context,
  );

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$amountAtom = Atom(
    name: '_PaymentFormStore.amount',
    context: context,
  );

  @override
  String get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$dateAtom = Atom(
    name: '_PaymentFormStore.date',
    context: context,
  );

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$periodAtom = Atom(
    name: '_PaymentFormStore.period',
    context: context,
  );

  @override
  String get period {
    _$periodAtom.reportRead();
    return super.period;
  }

  @override
  set period(String value) {
    _$periodAtom.reportWrite(value, super.period, () {
      super.period = value;
    });
  }

  late final _$categoryAtom = Atom(
    name: '_PaymentFormStore.category',
    context: context,
  );

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$_PaymentFormStoreActionController = ActionController(
    name: '_PaymentFormStore',
    context: context,
  );

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_PaymentFormStoreActionController.startAction(
      name: '_PaymentFormStore.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_PaymentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmount(String value) {
    final _$actionInfo = _$_PaymentFormStoreActionController.startAction(
      name: '_PaymentFormStore.setAmount',
    );
    try {
      return super.setAmount(value);
    } finally {
      _$_PaymentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value) {
    final _$actionInfo = _$_PaymentFormStoreActionController.startAction(
      name: '_PaymentFormStore.setDate',
    );
    try {
      return super.setDate(value);
    } finally {
      _$_PaymentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeriod(String value) {
    final _$actionInfo = _$_PaymentFormStoreActionController.startAction(
      name: '_PaymentFormStore.setPeriod',
    );
    try {
      return super.setPeriod(value);
    } finally {
      _$_PaymentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(String value) {
    final _$actionInfo = _$_PaymentFormStoreActionController.startAction(
      name: '_PaymentFormStore.setCategory',
    );
    try {
      return super.setCategory(value);
    } finally {
      _$_PaymentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_PaymentFormStoreActionController.startAction(
      name: '_PaymentFormStore.reset',
    );
    try {
      return super.reset();
    } finally {
      _$_PaymentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submit() {
    final _$actionInfo = _$_PaymentFormStoreActionController.startAction(
      name: '_PaymentFormStore.submit',
    );
    try {
      return super.submit();
    } finally {
      _$_PaymentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
amount: ${amount},
date: ${date},
period: ${period},
category: ${category},
isValid: ${isValid}
    ''';
  }
}
