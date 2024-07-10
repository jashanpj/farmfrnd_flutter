// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';

enum ExchangeConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllProducts
}

class ExchangeState extends Equatable {
  final List<Product> productsList;
  final int total;
  final int page;
  final bool hasData;
  final ExchangeConcreteState state;
  final String message;
  final bool isLoading;
  const ExchangeState({
    this.productsList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = ExchangeConcreteState.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const ExchangeState.initial({
    this.productsList = const [],
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = ExchangeConcreteState.initial,
    this.message = '',
  });

  ExchangeState copyWith({
    List<Product>? productsList,
    int? total,
    int? page,
    bool? hasData,
    ExchangeConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return ExchangeState(
      isLoading: isLoading ?? this.isLoading,
      productsList: productsList ?? this.productsList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'ExchangeState(isLoading:$isLoading, productLength: ${productsList.length},total:$total page: $page, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [productsList, page, hasData, state, message];
}
