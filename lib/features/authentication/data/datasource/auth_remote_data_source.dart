import 'package:flutter_project/shared/data/local/storage_service.dart';
import 'package:flutter_project/shared/data/remote/remote.dart';
import 'package:flutter_project/shared/domain/models/auth_response/auth_response.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/models.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class LoginUserDataSource {
  Future<Either<AppException, User>> loginUser(
      {required String email, required String password});
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkService networkService;
  final StorageService storage;

  LoginUserRemoteDataSource(this.networkService, this.storage);

  @override
  Future<Either<AppException, User>> loginUser(
      {required String email, required String password}) async {
    try {
      final eitherType = await networkService.post(
        '/users/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final user = AuthResponse.fromJson(response.data);
          final token = user.token;

          // update the token for requests
          networkService.updateHeader(
            {'Authorization': token},
          );

          storage.set('authToken', token);
          print("authToken $token");

          return Right(user.user);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
