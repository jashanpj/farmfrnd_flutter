import 'package:flutter_project/features/buy/domain/repositories/buy_product_repository.dart';
import 'package:flutter_project/features/buy/presentation/providers/state/exchange_state.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';
import 'package:flutter_project/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExchangeNotifier extends StateNotifier<ExchangeState> {
  final BuyProductRepository buyProductRepository;

  ExchangeNotifier(
    this.buyProductRepository,
  ) : super(const ExchangeState.initial());

  bool get isFetching =>
      state.state != ExchangeConcreteState.loading &&
      state.state != ExchangeConcreteState.fetchingMore;

  Future<void> fetchProducts(String categoryId) async {
    if (isFetching && state.state != ExchangeConcreteState.fetchedAllProducts) {
      state = state.copyWith(
        state: state.page > 0
            ? ExchangeConcreteState.fetchingMore
            : ExchangeConcreteState.loading,
        isLoading: true,
      );

      final response = await buyProductRepository.fetchProducts(
          skip: state.page * PRODUCTS_PER_PAGE, categoryId: categoryId);

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: ExchangeConcreteState.fetchedAllProducts,
        message: 'No more products available',
        isLoading: false,
      );
    }
  }

  void updateStateFromResponse(
      Either<AppException, PaginatedResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: ExchangeConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final productsList = data.docs.map((e) => Product.fromJson(e)).toList();

      final totalProducts = [...state.productsList, ...productsList];

      state = state.copyWith(
        productsList: totalProducts,
        state: totalProducts.length == data.totalPages
            ? ExchangeConcreteState.fetchedAllProducts
            : ExchangeConcreteState.loaded,
        hasData: true,
        message: totalProducts.isEmpty ? 'No products found' : '',
        page: totalProducts.length ~/ PRODUCTS_PER_PAGE,
        total: data.totalPages,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const ExchangeState.initial();
  }
}
