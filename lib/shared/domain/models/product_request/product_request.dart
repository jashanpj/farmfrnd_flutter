import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request.freezed.dart';
part 'product_request.g.dart';

@freezed
class ProductReuqest with _$ProductReuqest {
  const factory ProductReuqest({
    required String category,
    required String description,
    required List<String> location,
    required bool isProductNeededForExchange,
    required int quantity,
    required String unit,
    required String userId,
    required String createdAt,
    required String updatedAt,
  }) = _ProductReuqest;

  factory ProductReuqest.fromJson(Map<String, dynamic> json) =>
      _$ProductReuqestFromJson(json);
}
