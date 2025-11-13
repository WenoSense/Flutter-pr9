import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../models/payment.dart';
import '../stores/payments_list_store.dart';
import '../widgets/payment_card.dart';


class PaymentsListScreen extends StatefulWidget {
  const PaymentsListScreen({super.key});

  @override
  State<PaymentsListScreen> createState() => _PaymentsListScreenState();
}

class _PaymentsListScreenState extends State<PaymentsListScreen> {
  final store = GetIt.I<PaymentsListStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регулярные платежи'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border),
            tooltip: 'Избранное',
            onPressed: () => context.push('/favorites'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Настройки',
            onPressed: () => context.push('/settings'),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'О разработчике',
            onPressed: () => context.push('/about'),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          final filteredPayments = store.filteredPayments;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  onChanged: store.setSearchQuery,
                  decoration: const InputDecoration(
                    labelText: 'Поиск по названию',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: store.filterCategory,
                        items: store.categories
                            .map((c) =>
                            DropdownMenuItem(value: c, child: Text(c)))
                            .toList(),
                        onChanged: (v) {
                          if (v != null) store.setFilterCategory(v);
                        },
                        decoration:
                        const InputDecoration(labelText: 'Категория'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<SortOption>(
                        value: store.sortOption,
                        items: const [
                          DropdownMenuItem(
                            value: SortOption.nearestDate,
                            child: Text('По дате'),
                          ),
                          DropdownMenuItem(
                            value: SortOption.category,
                            child: Text('По категории'),
                          ),
                          DropdownMenuItem(
                            value: SortOption.amount,
                            child: Text('По сумме'),
                          ),
                        ],
                        onChanged: (v) {
                          if (v != null) store.setSortOption(v);
                        },
                        decoration:
                        const InputDecoration(labelText: 'Сортировка'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: filteredPayments.isEmpty
                    ? const Center(child: Text('Нет платежей'))
                    : ListView.builder(
                  itemCount: filteredPayments.length,
                  itemBuilder: (context, index) {
                    final Payment p = filteredPayments[index];
                    return PaymentCard(
                      payment: p,
                      onMarkPaid: store.markAsPaid,
                      onDelete: store.deletePayment,
                      onToggleFavorite: store.toggleFavorite,
                      isFavorite: p.isFavorite,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Добавить платёж',
        onPressed: () => context.push('/add'),
      ),
    );
  }
}