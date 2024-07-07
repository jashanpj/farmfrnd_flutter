import 'package:flutter_project/features/buy/data/datasource/buy_products_datasource.dart';
import 'package:flutter_project/features/buy/domain/repositories/buy_product_repository.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

class BuyProductRepositoryImpl extends BuyProductRepository {
  final BuyProductsRemoteDatasource buyProductsRemoteDatasource;
  BuyProductRepositoryImpl(this.buyProductsRemoteDatasource);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchProducts(
      {required int skip}) {
    return buyProductsRemoteDatasource.fetchPaginatedProducts(skip: skip);
  }
}
