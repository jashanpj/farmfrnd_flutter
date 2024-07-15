import 'package:flutter_project/shared/domain/models/category/category_model.dart';
import 'package:flutter_project/shared/domain/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    required String message,
    required ProductData doc,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@freezed
class ProductData with _$ProductData {
  const factory ProductData({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required Category category,
    required String description,
    required List<double> location,
    required bool isProductNeededForExchange,
    required int quantity,
    required String unit,
    required User userId,
  }) = _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}
