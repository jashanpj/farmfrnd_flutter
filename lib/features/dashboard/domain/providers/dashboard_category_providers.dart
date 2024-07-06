import 'package:flutter_project/features/dashboard/data/datasource/dashboard_remote_category.dart';
import 'package:flutter_project/features/dashboard/data/repositories/dashbpard_category_repository.dart';
import 'package:flutter_project/features/dashboard/domain/repositories/dashboard_category_repository.dart';
import 'package:flutter_project/shared/data/remote/network_service.dart';
import 'package:flutter_project/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_project/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardCategoryDatasourceProvider =
    Provider.family<DashboardCategoryDatasource, NetworkService>(
        (ref, networkService) {
  final storageService = ref.watch(storageServiceProvider);
  return DashboardCategoryRemoteDatasource(networkService, storageService);
});

final dashboardCategoryRepositoryProvider =
    Provider<DashboardCategoryRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource =
      ref.watch(dashboardCategoryDatasourceProvider(networkService));
  final repository = DashboardCategoryRepositoryImpl(datasource);

  return repository;
});
