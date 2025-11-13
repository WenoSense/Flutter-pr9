import 'package:mobx/mobx.dart';
import '../models/payment.dart';
import 'payments_list_store.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  final PaymentsListStore paymentsListStore;

  _FavoritesStore(this.paymentsListStore);

  @computed
  List<Payment> get favorites => paymentsListStore.favorites;

  @action
  void toggleFavorite(Payment payment) {
    paymentsListStore.toggleFavorite(payment);
  }
}
