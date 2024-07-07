import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  factory User({
    @Default('') String id,
    @Default('') String fullName,
    @Default('') String role,
    required List<double> location,
    @Default('') String status,
    @Default('') String email,
    @JsonKey(name: 'createdAt') required String createdDate,
    @JsonKey(name: 'updatedAt') required String updatedDate,
    @Default(0) int loginAttempts,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
