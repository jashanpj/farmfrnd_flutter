import 'package:flutter_project/features/buy/domain/repositories/buy_product_repository.dart';
import 'package:flutter_project/features/sell/domain/repositories/sell_products_repository.dart';
import 'package:flutter_project/features/sell/presentation/providers/state/sell_state.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';
import 'package:flutter_project/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SellNotifier extends StateNotifier<SellState> {
  final SellProductRepository sellProductRepository;

  SellNotifier(
    this.sellProductRepository,
  ) : super(const SellState.initial());

  bool get isFetching =>
      state.state != SellConcreteState.loading &&
      state.state != SellConcreteState.fetchingMore;

  Future<void> fetchProducts() async {
    if (isFetching && state.state != SellConcreteState.fetchedAllProducts) {
      state = state.copyWith(
        state: state.page > 0
            ? SellConcreteState.fetchingMore
            : SellConcreteState.loading,
        isLoading: true,
      );

      final response = await sellProductRepository.fetchProducts(
          skip: state.page * PRODUCTS_PER_PAGE);

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: SellConcreteState.fetchedAllProducts,
        message: 'No more products available',
        isLoading: false,
      );
    }
  }

  void updateStateFromResponse(
      Either<AppException, PaginatedResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: SellConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final productsList = data.docs.map((e) => Product.fromJson(e)).toList();

      final totalProducts = [...state.productsList, ...productsList];

      state = state.copyWith(
        productsList: totalProducts,
        state: totalProducts.length == data.totalPages
            ? SellConcreteState.fetchedAllProducts
            : SellConcreteState.loaded,
        hasData: true,
        message: totalProducts.isEmpty ? 'No products found' : '',
        page: totalProducts.length ~/ PRODUCTS_PER_PAGE,
        total: data.totalPages,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const SellState.initial();
  }
}
