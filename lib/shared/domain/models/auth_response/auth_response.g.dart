// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      exp: json['exp'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      token: json['token'] as String? ?? '',
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'exp': instance.exp,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
