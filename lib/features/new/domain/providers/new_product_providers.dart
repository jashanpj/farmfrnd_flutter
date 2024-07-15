import 'package:flutter_project/features/new/data/datasource/new_product_data_source.dart';
import 'package:flutter_project/features/new/data/repositories/new_product_repository.dart';
import 'package:flutter_project/features/new/domain/repositories/new_product_repository.dart';
import 'package:flutter_project/shared/data/remote/network_service.dart';
import 'package:flutter_project/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_project/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newProductsDatasourceProvider =
    Provider.family<NewProductRemoteDataSource, NetworkService>(
        (ref, networkService) {
  final storageService = ref.watch(storageServiceProvider);
  return NewProductRemoteDataSource(networkService, storageService);
});

final newProductsRepositoryProvider = Provider<NewProductRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(newProductsDatasourceProvider(networkService));
  final repository = NewProductRepositoryImpl(datasource);

  return repository;
});
