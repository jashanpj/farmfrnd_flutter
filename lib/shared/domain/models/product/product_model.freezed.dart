// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<double> get location => throw _privateConstructorUsedError;
  bool get isProductNeededForExchange => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  User? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String id,
      Category category,
      String description,
      List<double> location,
      bool isProductNeededForExchange,
      int quantity,
      String unit,
      User? userId,
      @JsonKey(name: 'createdAt') String createdDate,
      @JsonKey(name: 'updatedAt') String updatedDate});

  $CategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res>? get userId;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? description = null,
    Object? location = null,
    Object? isProductNeededForExchange = null,
    Object? quantity = null,
    Object? unit = null,
    Object? userId = freezed,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<double>,
      isProductNeededForExchange: null == isProductNeededForExchange
          ? _value.isProductNeededForExchange
          : isProductNeededForExchange // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as User?,
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

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get userId {
    if (_value.userId == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.userId!, (value) {
      return _then(_value.copyWith(userId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Category category,
      String description,
      List<double> location,
      bool isProductNeededForExchange,
      int quantity,
      String unit,
      User? userId,
      @JsonKey(name: 'createdAt') String createdDate,
      @JsonKey(name: 'updatedAt') String updatedDate});

  @override
  $CategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res>? get userId;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? description = null,
    Object? location = null,
    Object? isProductNeededForExchange = null,
    Object? quantity = null,
    Object? unit = null,
    Object? userId = freezed,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<double>,
      isProductNeededForExchange: null == isProductNeededForExchange
          ? _value.isProductNeededForExchange
          : isProductNeededForExchange // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as User?,
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
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {this.id = '',
      required this.category,
      this.description = '',
      required final List<double> location,
      this.isProductNeededForExchange = false,
      this.quantity = 0,
      this.unit = '',
      this.userId,
      @JsonKey(name: 'createdAt') required this.createdDate,
      @JsonKey(name: 'updatedAt') required this.updatedDate})
      : _location = location;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final Category category;
  @override
  @JsonKey()
  final String description;
  final List<double> _location;
  @override
  List<double> get location {
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_location);
  }

  @override
  @JsonKey()
  final bool isProductNeededForExchange;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final String unit;
  @override
  final User? userId;
  @override
  @JsonKey(name: 'createdAt')
  final String createdDate;
  @override
  @JsonKey(name: 'updatedAt')
  final String updatedDate;

  @override
  String toString() {
    return 'Product(id: $id, category: $category, description: $description, location: $location, isProductNeededForExchange: $isProductNeededForExchange, quantity: $quantity, unit: $unit, userId: $userId, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.isProductNeededForExchange,
                    isProductNeededForExchange) ||
                other.isProductNeededForExchange ==
                    isProductNeededForExchange) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
      category,
      description,
      const DeepCollectionEquality().hash(_location),
      isProductNeededForExchange,
      quantity,
      unit,
      userId,
      createdDate,
      updatedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
          {final String id,
          required final Category category,
          final String description,
          required final List<double> location,
          final bool isProductNeededForExchange,
          final int quantity,
          final String unit,
          final User? userId,
          @JsonKey(name: 'createdAt') required final String createdDate,
          @JsonKey(name: 'updatedAt') required final String updatedDate}) =
      _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get id;
  @override
  Category get category;
  @override
  String get description;
  @override
  List<double> get location;
  @override
  bool get isProductNeededForExchange;
  @override
  int get quantity;
  @override
  String get unit;
  @override
  User? get userId;
  @override
  @JsonKey(name: 'createdAt')
  String get createdDate;
  @override
  @JsonKey(name: 'updatedAt')
  String get updatedDate;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
