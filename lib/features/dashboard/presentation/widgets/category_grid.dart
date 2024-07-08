import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/routes/app_route.dart';
import 'package:flutter_project/shared/domain/models/category/category_model.dart';
import 'package:flutter_project/shared/widgets/card.dart';
import 'package:flutter_svg/svg.dart';

class CategoryGrid extends StatelessWidget {
  final ScrollController scrollController;
  final List<Category> categoryList;

  const CategoryGrid({
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
            return GestureDetector(
              onTap: () =>
                  AutoRouter.of(context).push(BuyRoute(categoryId: product.id)),
              child: ProductCard(
                imageUrl: product.imageUrl,
                name: product.name,
                nameML: product.nameML,
              ),
            );
          },
        ),
      ),
    );
  }
}
