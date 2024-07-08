import 'package:flutter_project/shared/data/local/storage_service.dart';
import 'package:flutter_project/shared/data/remote/remote.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class SellProductsDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedProducts(
      {required int skip});
}

class SellProductsRemoteDatasource extends SellProductsDatasource {
  final NetworkService networkService;
  final StorageService storage;
  SellProductsRemoteDatasource(this.networkService, this.storage);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedProducts(
      {required int skip}) async {
    final token = await storage.get('authToken');
    print("auth Token in Products call $token");
    // update the token for requests
    networkService.updateHeader(
      {'Authorization': 'Bearer $token'},
    );
    final response = await networkService.get(
      '/products',
      queryParameters: {
        'limit': '10',
        'where': {
          'or': [
            {
              'and': [
                {
                  'userId': {'equals': '668ab6d099ff998181e0255d'}
                }
              ]
            }
          ]
        }
      },
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse =
            PaginatedResponse.fromJson(jsonData, jsonData['docs'] ?? []);
        return Right(paginatedResponse);
      },
    );
  }
}
