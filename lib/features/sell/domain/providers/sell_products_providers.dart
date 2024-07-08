import 'package:flutter_project/features/sell/data/datasource/sell_products_datasource.dart';
import 'package:flutter_project/features/sell/data/repositories/sell_products_repository.dart';
import 'package:flutter_project/features/sell/domain/repositories/sell_products_repository.dart';
import 'package:flutter_project/shared/data/remote/network_service.dart';
import 'package:flutter_project/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_project/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sellProductsDatasourceProvider =
    Provider.family<SellProductsRemoteDatasource, NetworkService>(
        (ref, networkService) {
  final storageService = ref.watch(storageServiceProvider);
  return SellProductsRemoteDatasource(networkService, storageService);
});

final sellProductsRepositoryProvider = Provider<SellProductRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(sellProductsDatasourceProvider(networkService));
  final repository = SellProductRepositoryImpl(datasource);

  return repository;
});
