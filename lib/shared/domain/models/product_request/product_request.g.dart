// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReuqestImpl _$$ProductReuqestImplFromJson(Map<String, dynamic> json) =>
    _$ProductReuqestImpl(
      category: json['category'] as String,
      description: json['description'] as String,
      location: (json['location'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      isProductNeededForExchange: json['isProductNeededForExchange'] as bool,
      quantity: json['quantity'] as int,
      unit: json['unit'] as String,
      userId: json['userId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$ProductReuqestImplToJson(
        _$ProductReuqestImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'location': instance.location,
      'isProductNeededForExchange': instance.isProductNeededForExchange,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
