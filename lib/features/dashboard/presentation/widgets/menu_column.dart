import 'package:flutter/material.dart';
import 'package:flutter_project/shared/domain/models/category/category_model.dart';
import 'package:flutter_project/shared/widgets/card.dart'; // Adjust this import path as per your project structure
import 'package:flutter_svg/svg.dart';

class MenuColumn extends StatelessWidget {
  const MenuColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 8.0), // Optional: Add padding to the entire row
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150, // Set the desired height
                child: ProductCard(
                  name: "Buy",
                  localAssetPath: "assets/buy1.png",
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150, // Set the desired height
                child: ProductCard(
                  name: "Sell",
                  localAssetPath: "assets/sell1.png",
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150, // Set the desired height
                child: ProductCard(
                  name: "Exchange",
                  localAssetPath: "assets/exchange1.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String? imageUrl;
  final String name;
  final String? nameML;
  final double price;

  Product({
    this.imageUrl,
    required this.name,
    this.nameML,
    required this.price,
  });
}
