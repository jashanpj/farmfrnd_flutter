import 'package:freezed_annotation/freezed_annotation.dart';

import '../category/category_model.dart';
import '../user/user_converter.dart';
import '../user/user_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    @Default('') String id,
    required Category category,
    @Default('') String description,
    required List<double> location,
    @Default(false) bool isProductNeededForExchange,
    @Default(0) int quantity,
    @Default('') String unit,
    @UserIdConverter() User? userId,
    @JsonKey(name: 'createdAt') required String createdDate,
    @JsonKey(name: 'updatedAt') required String updatedDate,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
