// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      nameML: json['nameML'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      fruitOrVegetable: json['fruitOrVegetable'] as String? ?? '',
      meta: json['meta'] as Map<String, dynamic>? ?? const {},
      createdDate: json['createdAt'] as String,
      updatedDate: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameML': instance.nameML,
      'imageUrl': instance.imageUrl,
      'fruitOrVegetable': instance.fruitOrVegetable,
      'meta': instance.meta,
      'createdAt': instance.createdDate,
      'updatedAt': instance.updatedDate,
    };
