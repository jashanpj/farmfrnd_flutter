//
import 'package:flutter_project/features/buy/domain/providers/buy_products_providers.dart';
import 'package:flutter_project/features/buy/presentation/providers/state/buy_notifier.dart';
import 'package:flutter_project/features/buy/presentation/providers/state/buy_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final buyNotifierProvider = StateNotifierProvider<BuyNotifier, BuyState>((ref) {
  final repository = ref.watch(dashboardProductsRepositoryProvider);
  return BuyNotifier(repository);
});
