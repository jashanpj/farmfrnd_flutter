// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum NewProductConcreteState {
  initial,
  loading,
  loaded,
  failure,
  createProduct,
  createdProduct
}

class NewProductState extends Equatable {
  final String category;
  final String description;
  final List<String> location;
  final bool isProductNeededForExchange;
  final int quantity;
  final String unit;
  final String userId;
  final String createdAt;
  final String updatedAt;
  final NewProductConcreteState state;
  final String message;
  final bool isLoading;

  const NewProductState(
      {this.category = '',
      this.description = '',
      this.location = const [],
      this.isProductNeededForExchange = false,
      this.quantity = 0,
      this.unit = 'Kg',
      this.userId = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.state = NewProductConcreteState.initial,
      this.isLoading = false,
      this.message = ''});

  const NewProductState.initial(
      {this.category = '',
      this.description = '',
      this.location = const [],
      this.isProductNeededForExchange = false,
      this.quantity = 0,
      this.unit = '',
      this.userId = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.state = NewProductConcreteState.initial,
      this.isLoading = false,
      this.message = ''});

  NewProductState copyWith({
    String? category,
    String? description,
    List<String>? location,
    bool? isProductNeededForExchange,
    int? quantity,
    String? unit,
    String? userId,
    String? createdAt,
    String? updatedAt,
    NewProductConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return NewProductState(
      category: category ?? this.category,
      description: description ?? this.description,
      location: location ?? this.location,
      isProductNeededForExchange:
          isProductNeededForExchange ?? this.isProductNeededForExchange,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      state: state ?? this.state,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return 'NewProductState(category: $category, description: $description, location: $location, isProductNeededForExchange: $isProductNeededForExchange, quantity: $quantity, unit: $unit, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, state: $state)';
  }

  @override
  List<Object?> get props => [
        category,
        description,
        location,
        isProductNeededForExchange,
        quantity,
        unit,
        userId,
        createdAt,
        updatedAt,
        state,
        isLoading,
        message
      ];
}
