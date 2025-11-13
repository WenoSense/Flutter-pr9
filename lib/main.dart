import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'features/payments/stores/favorites_store.dart';
import 'features/payments/stores/payment_form_store.dart';
import 'features/payments/stores/payments_list_store.dart';


void main() {
  GetIt.I.registerSingleton<PaymentsListStore>(PaymentsListStore());
  GetIt.I.registerSingleton<PaymentFormStore>(PaymentFormStore(GetIt.I<PaymentsListStore>()));
  GetIt.I.registerSingleton<FavoritesStore>(FavoritesStore(GetIt.I<PaymentsListStore>()));
  runApp(const RegularPaymentsApp());
}
