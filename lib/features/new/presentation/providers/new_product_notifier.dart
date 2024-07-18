import 'package:flutter_project/features/new/domain/repositories/new_product_repository.dart';
import 'package:flutter_project/features/new/presentation/providers/new_product_state.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/product_request/product_request.dart';
import 'package:flutter_project/shared/domain/models/product_response/product_response.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewProductNotifier extends StateNotifier<NewProductState> {
  final NewProductRepository newProductRepository;

  NewProductNotifier(this.newProductRepository)
      : super(const NewProductState.initial());

  bool get isFetching => state.state != NewProductConcreteState.loading;

  Future<void> createProduct(ProductReuqest product) async {
    if (isFetching && state.state != NewProductConcreteState.createdProduct) {
      // Create an instance of ProductRequest

      print("Product in notifier $product");
      state = state.copyWith(
          state: NewProductConcreteState.loading, isLoading: true);

      final response =
          await newProductRepository.createProduct(skip: 1, product: product);

      updateStatefromresponse(response);
    }
  }

  void updateStatefromresponse(Either<AppException, ProductResponse> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: NewProductConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      state = state.copyWith(
        state: NewProductConcreteState.createdProduct,
        message: data.message,
        isLoading: false,
      );
    });
  }

  void reset() {
    state = const NewProductState.initial();
  }
}
