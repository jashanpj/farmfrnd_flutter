import 'package:flutter_project/features/new/data/datasource/new_product_data_source.dart';
import 'package:flutter_project/features/new/domain/repositories/new_product_repository.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/product_request/product_request.dart';
import 'package:flutter_project/shared/domain/models/product_response/product_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

class NewProductRepositoryImpl extends NewProductRepository {
  final NewProductRemoteDataSource newProductsRemoteDatasource;
  NewProductRepositoryImpl(this.newProductsRemoteDatasource);

  @override
  Future<Either<AppException, ProductResponse>> createProduct(
      {required int skip, required ProductReuqest product}) {
    return newProductsRemoteDatasource.createProduct(productData: product);
  }
}
