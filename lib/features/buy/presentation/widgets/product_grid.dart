import 'package:flutter/material.dart';
import 'package:flutter_project/shared/domain/models/category/category_model.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/widgets/card.dart';
import 'package:flutter_svg/svg.dart';

class ProductGrid extends StatelessWidget {
  final ScrollController scrollController;
  final List<Product> categoryList;

  const ProductGrid({
    Key? key,
    required this.scrollController,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: scrollController,
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3 / 4,
          ),
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            final product = categoryList[index];
            return ProductCard(
              imageUrl: product.category.imageUrl,
              name: product.category.name,
              nameML: product.category.nameML,
              price: product.quantity,
            );
          },
        ),
      ),
    );
  }
}
