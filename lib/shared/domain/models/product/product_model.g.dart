// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String? ?? '',
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      location: (json['location'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      isProductNeededForExchange:
          json['isProductNeededForExchange'] as bool? ?? false,
      quantity: json['quantity'] as int? ?? 0,
      unit: json['unit'] as String? ?? '',
      userId: const UserIdConverter().fromJson(json['userId']),
      createdDate: json['createdAt'] as String,
      updatedDate: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'location': instance.location,
      'isProductNeededForExchange': instance.isProductNeededForExchange,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'userId': const UserIdConverter().toJson(instance.userId),
      'createdAt': instance.createdDate,
      'updatedAt': instance.updatedDate,
    };
