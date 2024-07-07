import 'package:flutter/material.dart';
import 'package:flutter_project/shared/widgets/card.dart'; // Adjust this import path as per your project structure

class MenuColumn extends StatelessWidget {
  final Function(String)? onCardTap; // Callback function for tap events

  const MenuColumn({
    Key? key,
    this.onCardTap, // Optional: pass a function to handle card taps
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0), // Optional: Add padding to the entire row
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150, // Set the desired height
                child: InkWell(
                  onTap: () => onCardTap
                      ?.call("Buy"), // Call the function with a parameter
                  child: const ProductCard(
                    name: "Buy",
                    localAssetPath: "assets/buy1.png",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150, // Set the desired height
                child: InkWell(
                  onTap: () => onCardTap?.call("Sell"),
                  child: const ProductCard(
                    name: "Sell",
                    localAssetPath: "assets/sell1.png",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150, // Set the desired height
                child: InkWell(
                  onTap: () => onCardTap?.call("Exchange"),
                  child: const ProductCard(
                    name: "Exchange",
                    localAssetPath: "assets/exchange1.png",
                  ),
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
