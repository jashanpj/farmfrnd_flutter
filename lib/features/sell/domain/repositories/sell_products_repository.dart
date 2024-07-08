import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class SellProductRepository {
  Future<Either<AppException, PaginatedResponse>> fetchProducts(
      {required int skip});
}
