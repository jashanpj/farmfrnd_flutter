import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class Category with _$Category {
  factory Category({
    @Default('') String id,
    @Default('') String name,
    @Default('') String nameML,
    @Default('') String imageUrl,
    @Default('') String fruitOrVegetable,
    @Default({}) Map<String, dynamic> meta,
    @JsonKey(name: 'createdAt') required String createdDate,
    @JsonKey(name: 'updatedAt') required String updatedDate,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
