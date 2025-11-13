import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../stores/payment_form_store.dart';

class PaymentFormScreen extends StatefulWidget {
  const PaymentFormScreen({super.key});

  @override
  State<PaymentFormScreen> createState() => _PaymentFormScreenState();
}

class _PaymentFormScreenState extends State<PaymentFormScreen> {
  final store = GetIt.I<PaymentFormStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить платёж'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Назад',
          onPressed: () => context.pop(),
        ),
      ),
      body: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: store.setTitle,
                decoration:
                const InputDecoration(labelText: 'Название платежа'),
              ),
              TextField(
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                onChanged: store.setAmount,
                decoration: const InputDecoration(labelText: 'Сумма'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: store.category,
                items: store.categories
                    .map(
                      (c) => DropdownMenuItem(
                    value: c,
                    child: Text(c),
                  ),
                )
                    .toList(),
                onChanged: (v) {
                  if (v != null) store.setCategory(v);
                },
                decoration: const InputDecoration(labelText: 'Категория'),
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.datetime,
                onChanged: store.setDate,
                decoration: const InputDecoration(
                  labelText: 'Дата следующего платежа (ДД.ММ.ГГГГ)',
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: store.period,
                items: const [
                  DropdownMenuItem(
                      value: 'Еженедельно', child: Text('Еженедельно')),
                  DropdownMenuItem(
                      value: 'Ежемесячно', child: Text('Ежемесячно')),
                  DropdownMenuItem(
                      value: 'Ежегодно', child: Text('Ежегодно')),
                ],
                onChanged: (v) {
                  if (v != null) store.setPeriod(v);
                },
                decoration:
                const InputDecoration(labelText: 'Периодичность'),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: store.isValid
                      ? () {
                    store.submit();
                    context.go('/');
                  }
                      : null,
                  child: const Text('Сохранить'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
