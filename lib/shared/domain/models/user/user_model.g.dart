// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      role: json['role'] as String? ?? '',
      location: (json['location'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      status: json['status'] as String? ?? '',
      email: json['email'] as String? ?? '',
      createdDate: json['createdAt'] as String,
      updatedDate: json['updatedAt'] as String,
      loginAttempts: json['loginAttempts'] as int? ?? 0,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'role': instance.role,
      'location': instance.location,
      'status': instance.status,
      'email': instance.email,
      'createdAt': instance.createdDate,
      'updatedAt': instance.updatedDate,
      'loginAttempts': instance.loginAttempts,
    };
