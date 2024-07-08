import 'package:flutter_project/features/sell/data/datasource/sell_products_datasource.dart';
import 'package:flutter_project/features/sell/domain/repositories/sell_products_repository.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

class SellProductRepositoryImpl extends SellProductRepository {
  final SellProductsRemoteDatasource sellProductsRemoteDatasource;
  SellProductRepositoryImpl(this.sellProductsRemoteDatasource);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchProducts(
      {required int skip}) {
    return sellProductsRemoteDatasource.fetchPaginatedProducts(skip: skip);
  }
}
