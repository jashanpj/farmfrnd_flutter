import 'package:flutter_project/shared/data/local/storage_service.dart';
import 'package:flutter_project/shared/data/remote/remote.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';
import 'package:flutter_project/shared/globals.dart';

abstract class DashboardCategoryDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedCategories(
      {required int skip});
}

class DashboardCategoryRemoteDatasource extends DashboardCategoryDatasource {
  final NetworkService networkService;
  final StorageService storage;
  DashboardCategoryRemoteDatasource(this.networkService, this.storage);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedCategories(
      {required int skip}) async {
    final token = await storage.get('authToken');
    print("auth Token in Categorycall $token");
    // update the token for requests
    networkService.updateHeader(
      {'Authorization': 'Bearer $token'},
    );
    final response = await networkService.get('/categories');

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

  // @override
  // Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
  //     {required int skip, required String query}) async {
  //   final response = await networkService.get(
  //     '/products/search?q=$query',
  //     queryParameters: {
  //       'skip': skip,
  //       'limit': PRODUCTS_PER_PAGE,
  //     },
  //   );

  //   return response.fold(
  //     (l) => Left(l),
  //     (r) {
  //       final jsonData = r.data;
  //       if (jsonData == null) {
  //         return Left(
  //           AppException(
  //             identifier: 'search PaginatedData',
  //             statusCode: 0,
  //             message: 'The data is not in the valid format.',
  //           ),
  //         );
  //       }
  //       final paginatedResponse =
  //           PaginatedResponse.fromJson(jsonData, jsonData['products'] ?? []);
  //       return Right(paginatedResponse);
  //     },
  //   );
  // }
}
