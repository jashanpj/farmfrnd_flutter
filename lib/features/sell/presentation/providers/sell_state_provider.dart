//
import 'package:flutter_project/features/sell/domain/providers/sell_products_providers.dart';
import 'package:flutter_project/features/sell/presentation/providers/state/sell_notifier.dart';
import 'package:flutter_project/features/sell/presentation/providers/state/sell_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sellNotifierProvider =
    StateNotifierProvider<SellNotifier, SellState>((ref) {
  final repository = ref.watch(sellProductsRepositoryProvider);
  return SellNotifier(repository)..fetchProducts();
});
