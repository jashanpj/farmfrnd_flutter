import 'package:flutter_project/shared/data/local/storage_service.dart';
import 'package:flutter_project/shared/data/remote/remote.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class BuyProductsDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedProducts(
      {required int skip, required String categoryId});
}

class BuyProductsRemoteDatasource extends BuyProductsDatasource {
  final NetworkService networkService;
  final StorageService storage;
  BuyProductsRemoteDatasource(this.networkService, this.storage);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedProducts(
      {required int skip, required String categoryId}) async {
    final token = await storage.get('authToken');
    print("auth Token in Products call $token");
    // update the token for requests
    networkService.updateHeader(
      {'Authorization': 'Bearer $token'},
    );

    final queryParamsNormal = {
      'depth': '1',
    };

    final queryParamsCategory = {
      'limit': '10',
      'where': {
        'or': [
          {
            'and': [
              {
                'category': {'equals': categoryId}
              }
            ]
          }
        ]
      }
    };

    final queryParamsProductsExchangeList = {
      'where': {
        'or': [
          {
            'and': [
              {
                'isProductNeededForExchange': {'equals': true}
              },
              {
                'userId': {'not_equals': '668ab6d099ff998181e0255d'}
              }
            ]
          }
        ]
      }
    };

    final queryParamsProductsExchangeListSelf = {
      'where': {
        'or': [
          {
            'and': [
              {
                'isProductNeededForExchange': {'equals': true}
              },
              {
                'userId': {'equals': '668ab6d099ff998181e0255d'}
              }
            ]
          }
        ]
      }
    };

//668186cf99ff998181e020ac
    var isNormalQuery = true;

    if (categoryId == 'none') {
      isNormalQuery = true;
    } else {
      isNormalQuery = false;
    }

    final response = await networkService.get('/products',
        queryParameters:
            isNormalQuery ? queryParamsNormal : queryParamsCategory);

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
