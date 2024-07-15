import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/product_request/product_request.dart';
import 'package:flutter_project/shared/domain/models/product_response/product_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class NewProductRepository {
  Future<Either<AppException, ProductResponse>> createProduct(
      {required int skip, required ProductReuqest product});
}
