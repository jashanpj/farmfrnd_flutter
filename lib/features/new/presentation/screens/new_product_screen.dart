import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/buy/presentation/providers/buy_state_provider.dart';
import 'package:flutter_project/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter_project/features/new/presentation/providers/new_product_state.dart';
import 'package:flutter_project/features/new/presentation/providers/new_products_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/shared/domain/models/category/category_model.dart';

import '../../../dashboard/presentation/providers/dashboard_state_provider.dart';
import '../../../dashboard/presentation/providers/state/dashboard_state.dart';

@RoutePage()
class NewProductScreen extends ConsumerStatefulWidget {
  static const String routeName = 'NewProductScreen';
  final bool isExchangeNeedToShow;

  const NewProductScreen({Key? key, required this.isExchangeNeedToShow})
      : super(key: key);

  @override
  ConsumerState<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends ConsumerState<NewProductScreen> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isSearchActive = false;
  bool isExchangeChecked = false;
  Timer? _debounce;

  String selectedCategory = 'Vegetables';
  late Category selectedProduct;
  String selectedQuantityType = 'Kg';

  @override
  void initState() {
    super.initState();
    final notifier = ref.read(newProductsNotifierProvider.notifier);
    final categoryNotifier = ref.read(dashboardNotifierProvider.notifier);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    quantityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(buyNotifierProvider);
    final categoryState = ref.watch(dashboardNotifierProvider);

    selectedProduct = categoryState.categoryList.isNotEmpty
        ? categoryState.categoryList.first
        : Category(
            id: '',
            name: '',
            nameML: '',
            imageUrl: '',
            fruitOrVegetable: '',
            meta: {},
            createdDate: '',
            updatedDate: '',
          );

    ref.listen(
      dashboardNotifierProvider.select((value) => value),
      ((DashboardState? previous, DashboardState next) {
        //show Snackbar on failure
        if (next.state == DashboardConcreteState.fetchedAllCategories) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }
      }),
    );

    ref.listen(
      newProductsNotifierProvider.select((value) => value),
      ((NewProductState? previous, NewProductState next) {
        // Show Snackbar on success
        if (next.state == NewProductConcreteState.createdProduct) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }
      }),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmFrnd'),
      ),
      drawer: const DashboardDrawer(),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Create New Product",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Empower Your Market: Sell Fresh, Sell Local",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // Selection button for Vegetables/Fruits
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Vegetables'),
                  selected: selectedCategory == 'Vegetables',
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = 'Vegetables';
                      // Update product list based on category
                    });
                  },
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Fruits'),
                  selected: selectedCategory == 'Fruits',
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = 'Fruits';
                      // Update product list based on category
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Dropdown with list of Vegetables/Fruits
            DropdownButton<Category>(
              value: selectedProduct,
              onChanged: (Category? newValue) {
                setState(() {
                  if (newValue != null) {
                    selectedProduct = newValue;
                  }
                });
              },
              items: categoryState.categoryList
                  .map<DropdownMenuItem<Category>>((Category category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              isExpanded: true,
            ),

            const SizedBox(height: 20),
            // Dropdown of quantity type (Kg/NoS) and a text field for entering quantity
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButton<String>(
                    value: selectedQuantityType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedQuantityType = newValue!;
                      });
                    },
                    items: <String>['Kg', 'NoS']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Description text field multiline
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Checkbox with title "Show in exchange list also"
            CheckboxListTile(
              title: const Text('Show the product in exchange list also'),
              value: isExchangeChecked,
              onChanged: (bool? value) {
                setState(() {
                  isExchangeChecked = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            // Submit button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the submit action
                  print('Submit button pressed');
                  // Add your product submission logic here
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
