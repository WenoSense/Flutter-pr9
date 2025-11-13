import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import '../models/payment.dart';
import 'payments_list_store.dart';

part 'payment_form_store.g.dart';

class PaymentFormStore = _PaymentFormStore with _$PaymentFormStore;

abstract class _PaymentFormStore with Store {
  final PaymentsListStore paymentsListStore;

  _PaymentFormStore(this.paymentsListStore);

  @observable
  String title = '';

  @observable
  String amount = '';

  @observable
  String date = '';

  @observable
  String period = 'Ежемесячно';

  @observable
  String category = 'Подписки';

  final List<String> categories = const [
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
  bool get isValid {
    final parsedAmount = double.tryParse(amount.replaceAll(',', '.')) ?? 0;
    if (title.trim().isEmpty || parsedAmount <= 0 || date.trim().isEmpty) {
      return false;
    }
    try {
      DateFormat('dd.MM.yyyy').parseStrict(date);
      return true;
    } catch (_) {
      return false;
    }
  }

  @action
  void setTitle(String value) => title = value;

  @action
  void setAmount(String value) => amount = value;

  @action
  void setDate(String value) => date = value;

  @action
  void setPeriod(String value) => period = value;

  @action
  void setCategory(String value) => category = value;

  @action
  void reset() {
    title = '';
    amount = '';
    date = '';
    period = 'Ежемесячно';
    category = 'Подписки';
  }

  @action
  void submit() {
    if (!isValid) return;

    final parsedAmount = double.parse(amount.replaceAll(',', '.'));
    final parsedDate = DateFormat('dd.MM.yyyy').parseStrict(date);

    final payment = Payment(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title.trim(),
      amount: parsedAmount,
      category: category,
      nextDate: parsedDate,
      period: period,
    );

    paymentsListStore.addPayment(payment);
    reset();
  }
}
