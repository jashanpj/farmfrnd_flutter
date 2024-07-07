import 'package:flutter_project/features/buy/data/datasource/buy_products_datasource.dart';
import 'package:flutter_project/features/buy/data/repositories/buy_products_repository.dart';
import 'package:flutter_project/features/buy/domain/repositories/buy_product_repository.dart';
import 'package:flutter_project/shared/data/remote/network_service.dart';
import 'package:flutter_project/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_project/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final buyProductsDatasourceProvider =
    Provider.family<BuyProductsRemoteDatasource, NetworkService>(
        (ref, networkService) {
  final storageService = ref.watch(storageServiceProvider);
  return BuyProductsRemoteDatasource(networkService, storageService);
});

final dashboardProductsRepositoryProvider =
    Provider<BuyProductRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(buyProductsDatasourceProvider(networkService));
  final repository = BuyProductRepositoryImpl(datasource);

  return repository;
});
