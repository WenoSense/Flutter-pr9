import 'package:mobx/mobx.dart';
import '../models/payment.dart';

part 'payments_list_store.g.dart';

enum SortOption { nearestDate, category, amount }

class PaymentsListStore = _PaymentsListStore with _$PaymentsListStore;

abstract class _PaymentsListStore with Store {
  _PaymentsListStore();

  @observable
  ObservableList<Payment> payments = ObservableList<Payment>();

  @observable
  SortOption sortOption = SortOption.nearestDate;

  @observable
  String searchQuery = '';

  @observable
  String filterCategory = 'Все';

  final List<String> categories = const [
    'Все',
    'Подписки',
    'Коммунальные услуги',
    'Аренда',
    'Кредиты',
    'Транспорт',
    'Связь',
    'Продукты',
    'Другое',
  ];

  @computed
  List<Payment> get sortedPayments {
    final now = DateTime.now();
    final sorted = List<Payment>.from(payments);
    switch (sortOption) {
      case SortOption.nearestDate:
        sorted.sort((a, b) =>
            a.nextDate.difference(now).inDays.compareTo(
                b.nextDate.difference(now).inDays));
        break;
      case SortOption.category:
        sorted.sort((a, b) => a.category.compareTo(b.category));
        break;
      case SortOption.amount:
        sorted.sort((a, b) => a.amount.compareTo(b.amount));
        break;
    }
    return sorted;
  }

  @computed
  List<Payment> get filteredPayments {
    return sortedPayments.where((p) {
      final matchesSearch =
      p.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory =
          filterCategory == 'Все' || p.category == filterCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @computed
  List<Payment> get favorites =>
      payments.where((p) => p.isFavorite).toList();

  @action
  void setSortOption(SortOption value) => sortOption = value;

  @action
  void setSearchQuery(String value) => searchQuery = value;

  @action
  void setFilterCategory(String value) => filterCategory = value;

  @action
  void addPayment(Payment payment) {
    payments.add(payment);
  }

  @action
  void deletePayment(String id) {
    payments.removeWhere((p) => p.id == id);
  }

  @action
  void markAsPaid(String id) {
    final index = payments.indexWhere((p) => p.id == id);
    if (index == -1) return;

    final p = payments[index];
    payments[index] = Payment(
      id: p.id,
      title: p.title,
      amount: p.amount,
      category: p.category,
      nextDate: p.updatedNextDate,
      period: p.period,
      isFavorite: p.isFavorite,
    );
  }

  @action
  void toggleFavorite(Payment payment) {
    final index = payments.indexWhere((p) => p.id == payment.id);
    if (index == -1) return;
    final p = payments[index];
    payments[index] = Payment(
      id: p.id,
      title: p.title,
      amount: p.amount,
      category: p.category,
      nextDate: p.nextDate,
      period: p.period,
      isFavorite: !p.isFavorite,
    );
  }
}
