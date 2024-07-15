import 'package:flutter_project/shared/data/local/storage_service.dart';
import 'package:flutter_project/shared/data/remote/network_service.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/product_request/product_request.dart';
import 'package:flutter_project/shared/domain/models/product_response/product_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class NewProductDataSource {
  Future<Either<AppException, ProductResponse>> createProduct(
      {required ProductReuqest productData});
}

class NewProductRemoteDataSource extends NewProductDataSource {
  final NetworkService networkService;
  final StorageService storage;
  NewProductRemoteDataSource(this.networkService, this.storage);
  @override
  Future<Either<AppException, ProductResponse>> createProduct(
      {required ProductReuqest productData}) async {
    final token = await storage.get('authToken');
    print("auth Token in Products call $token");
    // update the token for requests
    networkService.updateHeader(
      {'Authorization': 'Bearer $token'},
    );

    final eitherType = await networkService.post(
      '/products',
      data: {
        'category': productData.category,
        'description': productData.description,
        'location': productData.location,
        'isProductNeededForExchange': productData.isProductNeededForExchange,
        'quantity': productData.quantity,
        'unit': productData.unit,
        'userId': productData.userId,
        'createdAt': '', // Assuming you will set this value later
        'updatedAt': '', // Assuming you will set this value later
      },
    );

    return eitherType.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'createProduct',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }

        try {
          final productResponse = ProductResponse.fromJson(jsonData);
          return Right(productResponse);
        } catch (e) {
          return Left(
            AppException(
              identifier: 'createProduct',
              statusCode: 0,
              message: 'Failed to parse the response.',
            ),
          );
        }
      },
    );
  }
}
