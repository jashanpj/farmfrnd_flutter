import 'package:flutter/material.dart';
import 'package:flutter_project/features/buy/presentation/widgets/product_card.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/domain/models/user/user_model.dart';

class ProductList extends StatelessWidget {
  final ScrollController scrollController;
  final List<Product> productList;

  const ProductList({
    Key? key,
    required this.scrollController,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductCard(
                imageUrl: product.category.imageUrl ??
                    '', // Ensure imageUrl is never null
                name: product.category.name,
                quantity: product.quantity,
                nameMl: product.category.nameML,
                onProductTap: () => _handleOnTap(product.userId, context),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleOnTap(User? user, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${user?.fullName} tapped!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
