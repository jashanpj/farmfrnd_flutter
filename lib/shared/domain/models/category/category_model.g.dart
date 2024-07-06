// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      name: json['name'] as String,
      nameML: json['nameML'] as String?,
      imageUrl: json['imageUrl'] as String?,
      fruitOrVegetable: json['fruitOrVegetable'] as String?,
      sequenceNo: json['sequenceNo'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      parentCategoryId: json['parentCategoryId'] as int?,
      whishListIds: (json['whishListIds'] as List<dynamic>?)
          ?.map((e) => WhishList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameML': instance.nameML,
      'imageUrl': instance.imageUrl,
      'fruitOrVegetable': instance.fruitOrVegetable,
      'sequenceNo': instance.sequenceNo,
      'thumbnailUrl': instance.thumbnailUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'parentCategoryId': instance.parentCategoryId,
      'whishListIds': instance.whishListIds,
    };

_$WhishListImpl _$$WhishListImplFromJson(Map<String, dynamic> json) =>
    _$WhishListImpl(
      fullName: json['fullName'] as String,
      role: json['role'] as String,
      location:
          (json['location'] as List<dynamic>).map((e) => e as String).toList(),
      otp: json['otp'] as String,
      username: json['username'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      email: json['email'] as String,
      resetPasswordToken: json['resetPasswordToken'] as String,
      resetPasswordExpiration: json['resetPasswordExpiration'] as String,
      salt: json['salt'] as String,
      hash: json['hash'] as String,
      loginAttempts: json['loginAttempts'] as int,
      lockUntil: json['lockUntil'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$WhishListImplToJson(_$WhishListImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'role': instance.role,
      'location': instance.location,
      'otp': instance.otp,
      'username': instance.username,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'email': instance.email,
      'resetPasswordToken': instance.resetPasswordToken,
      'resetPasswordExpiration': instance.resetPasswordExpiration,
      'salt': instance.salt,
      'hash': instance.hash,
      'loginAttempts': instance.loginAttempts,
      'lockUntil': instance.lockUntil,
      'password': instance.password,
    };
