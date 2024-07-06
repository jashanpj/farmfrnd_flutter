import 'package:flutter_project/features/dashboard/domain/repositories/dashboard_category_repository.dart';
import 'package:flutter_project/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:flutter_project/shared/domain/models/category/category_model.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';
import 'package:flutter_project/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  final DashboardCategoryRepository dashboardCategoryRepository;

  DashboardNotifier(
    this.dashboardCategoryRepository,
  ) : super(const DashboardState.initial());

  bool get isFetching =>
      state.state != DashboardConcreteState.loading &&
      state.state != DashboardConcreteState.fetchingMore;

  Future<void> fetchCategories() async {
    if (isFetching &&
        state.state != DashboardConcreteState.fetchedAllCategories) {
      state = state.copyWith(
        state: state.page > 0
            ? DashboardConcreteState.fetchingMore
            : DashboardConcreteState.loading,
        isLoading: true,
      );

      final response = await dashboardCategoryRepository.fetchCategories(
          skip: state.page * PRODUCTS_PER_PAGE);

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: DashboardConcreteState.fetchedAllCategories,
        message: 'No more products available',
        isLoading: false,
      );
    }
  }

  // Future<void> searchProducts(String query) async {
  //   if (isFetching &&
  //       state.state != DashboardConcreteState.fetchedAllCategories) {
  //     state = state.copyWith(
  //       state: state.page > 0
  //           ? DashboardConcreteState.fetchingMore
  //           : DashboardConcreteState.loading,
  //       isLoading: true,
  //     );

  //     final response = await dashboardRepository.searchProducts(
  //       skip: state.page * PRODUCTS_PER_PAGE,
  //       query: query,
  //     );

  //     updateStateFromResponse(response);
  //   } else {
  //     state = state.copyWith(
  //       state: DashboardConcreteState.fetchedAllCategories,
  //       message: 'No more products available',
  //       isLoading: false,
  //     );
  //   }
  // }

  void updateStateFromResponse(
      Either<AppException, PaginatedResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: DashboardConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final categoryList = data.docs.map((e) => Category.fromJson(e)).toList();

      final totalProducts = [...state.categoryList, ...categoryList];

      state = state.copyWith(
        categoryList: totalProducts,
        state: totalProducts.length == data.totalPages
            ? DashboardConcreteState.fetchedAllCategories
            : DashboardConcreteState.loaded,
        hasData: true,
        message: totalProducts.isEmpty ? 'No products found' : '',
        page: totalProducts.length ~/ PRODUCTS_PER_PAGE,
        total: data.totalPages,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const DashboardState.initial();
  }
}
