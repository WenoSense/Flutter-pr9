import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../models/payment.dart';
import '../stores/favorites_store.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final store = GetIt.I<FavoritesStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранные платежи'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Назад',
          onPressed: () => context.pop(),
        ),
      ),
      body: Observer(
        builder: (_) {
          final favorites = store.favorites;

          if (favorites.isEmpty) {
            return const Center(child: Text('Нет избранных платежей'));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final Payment payment = favorites[index];
              return Card(
                margin:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text('${payment.title} (${payment.category})'),
                  subtitle: Text('Сумма: ${payment.amount}₽'),
                  trailing: IconButton(
                    icon: const Icon(Icons.star),
                    color: Colors.amber,
                    tooltip: 'Убрать из избранного',
                    onPressed: () => store.toggleFavorite(payment),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
