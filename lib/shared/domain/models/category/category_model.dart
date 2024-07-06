import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String name,
    required String nameML,
    required String imageUrl,
    required String fruitOrVegetable,
    required String sequenceNo,
    required String thumbnailUrl,
    required String createdAt,
    required String updatedAt,
    required int parentCategoryId,
    required List<WhishList> whishListIds,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class WhishList with _$WhishList {
  const factory WhishList({
    required String fullName,
    required String role,
    required List<String> location,
    required String otp,
    required String username,
    required String status,
    required String createdAt,
    required String updatedAt,
    required String email,
    required String resetPasswordToken,
    required String resetPasswordExpiration,
    required String salt,
    required String hash,
    required int loginAttempts,
    required String lockUntil,
    required String password,
  }) = _WhishList;

  factory WhishList.fromJson(Map<String, dynamic> json) =>
      _$WhishListFromJson(json);
}
