// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameML => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get fruitOrVegetable => throw _privateConstructorUsedError;
  Map<String, dynamic> get meta => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {String id,
      String name,
      String nameML,
      String imageUrl,
      String fruitOrVegetable,
      Map<String, dynamic> meta,
      @JsonKey(name: 'createdAt') String createdDate,
      @JsonKey(name: 'updatedAt') String updatedDate});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameML = null,
    Object? imageUrl = null,
    Object? fruitOrVegetable = null,
    Object? meta = null,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameML: null == nameML
          ? _value.nameML
          : nameML // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fruitOrVegetable: null == fruitOrVegetable
          ? _value.fruitOrVegetable
          : fruitOrVegetable // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String nameML,
      String imageUrl,
      String fruitOrVegetable,
      Map<String, dynamic> meta,
      @JsonKey(name: 'createdAt') String createdDate,
      @JsonKey(name: 'updatedAt') String updatedDate});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameML = null,
    Object? imageUrl = null,
    Object? fruitOrVegetable = null,
    Object? meta = null,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameML: null == nameML
          ? _value.nameML
          : nameML // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fruitOrVegetable: null == fruitOrVegetable
          ? _value.fruitOrVegetable
          : fruitOrVegetable // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  _$CategoryImpl(
      {this.id = '',
      this.name = '',
      this.nameML = '',
      this.imageUrl = '',
      this.fruitOrVegetable = '',
      final Map<String, dynamic> meta = const {},
      @JsonKey(name: 'createdAt') required this.createdDate,
      @JsonKey(name: 'updatedAt') required this.updatedDate})
      : _meta = meta;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String nameML;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String fruitOrVegetable;
  final Map<String, dynamic> _meta;
  @override
  @JsonKey()
  Map<String, dynamic> get meta {
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meta);
  }

  @override
  @JsonKey(name: 'createdAt')
  final String createdDate;
  @override
  @JsonKey(name: 'updatedAt')
  final String updatedDate;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, nameML: $nameML, imageUrl: $imageUrl, fruitOrVegetable: $fruitOrVegetable, meta: $meta, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameML, nameML) || other.nameML == nameML) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.fruitOrVegetable, fruitOrVegetable) ||
                other.fruitOrVegetable == fruitOrVegetable) &&
            const DeepCollectionEquality().equals(other._meta, _meta) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      nameML,
      imageUrl,
      fruitOrVegetable,
      const DeepCollectionEquality().hash(_meta),
      createdDate,
      updatedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  factory _Category(
          {final String id,
          final String name,
          final String nameML,
          final String imageUrl,
          final String fruitOrVegetable,
          final Map<String, dynamic> meta,
          @JsonKey(name: 'createdAt') required final String createdDate,
          @JsonKey(name: 'updatedAt') required final String updatedDate}) =
      _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get nameML;
  @override
  String get imageUrl;
  @override
  String get fruitOrVegetable;
  @override
  Map<String, dynamic> get meta;
  @override
  @JsonKey(name: 'createdAt')
  String get createdDate;
  @override
  @JsonKey(name: 'updatedAt')
  String get updatedDate;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
