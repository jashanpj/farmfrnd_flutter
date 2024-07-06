// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project/shared/domain/models/category/category_model.dart'
    as cat;

enum DashboardConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllCategories
}

class DashboardState extends Equatable {
  final List<cat.Category> categoryList;
  final int total;
  final int page;
  final bool hasData;
  final DashboardConcreteState state;
  final String message;
  final bool isLoading;
  const DashboardState({
    this.categoryList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = DashboardConcreteState.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const DashboardState.initial({
    this.categoryList = const [],
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = DashboardConcreteState.initial,
    this.message = '',
  });

  DashboardState copyWith({
    List<cat.Category>? categoryList,
    int? total,
    int? page,
    bool? hasData,
    DashboardConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      categoryList: categoryList ?? this.categoryList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'DashboardState(isLoading:$isLoading, productLength: ${categoryList.length},total:$total page: $page, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [categoryList, page, hasData, state, message];
}
