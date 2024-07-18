import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model.dart';

class UserIdConverter implements JsonConverter<User?, dynamic> {
  const UserIdConverter();

  @override
  User? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    if (json is String) {
      return User(
        id: json,
        fullName: '',
        role: '',
        location: [],
        status: '',
        email: '',
        createdDate: '',
        updatedDate: '',
        loginAttempts: 0,
      );
    } else if (json is Map<String, dynamic>) {
      return User.fromJson(json);
    }
    throw Exception('Invalid userId format');
  }

  @override
  dynamic toJson(User? user) => user?.toJson();
}
