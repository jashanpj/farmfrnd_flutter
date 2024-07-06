import 'package:flutter_project/features/dashboard/data/datasource/dashboard_remote_category.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

import '../../domain/repositories/dashboard_category_repository.dart';

class DashboardCategoryRepositoryImpl extends DashboardCategoryRepository {
  final DashboardCategoryDatasource dashBoardCategoryDataSource;
  DashboardCategoryRepositoryImpl(this.dashBoardCategoryDataSource);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchCategories(
      {required int skip}) {
    return dashBoardCategoryDataSource.fetchPaginatedCategories(skip: skip);
  }
}
