import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class DashboardCategoryRepository {
  Future<Either<AppException, PaginatedResponse>> fetchCategories(
      {required int skip});
}
