//
import 'package:flutter_project/features/new/domain/providers/new_product_providers.dart';
import 'package:flutter_project/features/new/presentation/providers/new_product_notifier.dart';
import 'package:flutter_project/features/new/presentation/providers/new_product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newProductsNotifierProvider =
    StateNotifierProvider<NewProductNotifier, NewProductState>((ref) {
  final repository = ref.watch(newProductsRepositoryProvider);
  return NewProductNotifier(repository);
});
