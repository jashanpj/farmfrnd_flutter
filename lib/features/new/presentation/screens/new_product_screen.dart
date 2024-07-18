import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/services/user_cache_service/domain/providers/current_user_provider.dart';
import 'package:flutter_project/shared/domain/models/product_request/product_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/features/buy/presentation/providers/buy_state_provider.dart';
import 'package:flutter_project/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter_project/features/new/presentation/providers/new_product_state.dart';
import 'package:flutter_project/features/new/presentation/providers/new_products_state_provider.dart';
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
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isExchangeChecked = false;
  Timer? _debounce;
  String selectedCategory = 'Vegetables';
  Category? selectedProduct;
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
    final categoryState = ref.watch(dashboardNotifierProvider);
    final productState = ref.watch(newProductsNotifierProvider);

    if (selectedProduct == null && categoryState.categoryList.isNotEmpty) {
      selectedProduct = categoryState.categoryList.first;
    }

    ref.listen(dashboardNotifierProvider.select((value) => value),
        (DashboardState? previous, DashboardState next) {
      if (next.state == DashboardConcreteState.fetchedAllCategories &&
          next.message.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.message.toString())));
      }
    });

    ref.listen(newProductsNotifierProvider.select((value) => value),
        (NewProductState? previous, NewProductState next) {
      if (next.state == NewProductConcreteState.createdProduct &&
          next.message.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.message.toString())));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('FarmFrnd')),
      drawer: const DashboardDrawer(),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildTitle(context),
              const SizedBox(height: 8),
              _buildSubtitle(context),
              const SizedBox(height: 20),
              _buildCategorySelection(),
              const SizedBox(height: 20),
              _buildProductDropdown(categoryState),
              const SizedBox(height: 20),
              _buildQuantityField(),
              const SizedBox(height: 20),
              _buildDescriptionField(),
              const SizedBox(height: 20),
              _buildExchangeCheckbox(),
              const SizedBox(height: 20),
              _buildSubmitButton(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text("Create New Product",
        style: Theme.of(context).textTheme.displayLarge);
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text("Empower Your Market: Sell Fresh, Sell Local",
        style: Theme.of(context).textTheme.headlineMedium);
  }

  Widget _buildCategorySelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text('Vegetables'),
          selected: selectedCategory == 'Vegetables',
          onSelected: (selected) {
            setState(() {
              selectedCategory = 'Vegetables';
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
            });
          },
        ),
      ],
    );
  }

  Widget _buildProductDropdown(DashboardState categoryState) {
    return DropdownButton<Category>(
      value: selectedProduct,
      onChanged: (Category? newValue) {
        setState(() {
          selectedProduct = newValue!;
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
    );
  }

  Widget _buildQuantityField() {
    return Row(
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
          child: TextFormField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantity',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter quantity';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: descriptionController,
      maxLines: 4,
      decoration: const InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter description';
        }
        return null;
      },
    );
  }

  Widget _buildExchangeCheckbox() {
    return CheckboxListTile(
      title: const Text('Show the product in exchange list also'),
      value: isExchangeChecked,
      onChanged: (bool? value) {
        setState(() {
          isExchangeChecked = value!;
        });
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            // Handle the submit action
            print('Submit button pressed');
            // Add your product submission logic here

            // Fetch current user
            final user = await ref.read(currentUserProvider.future);
            print("User: ${user?.fullName}, Email: ${user?.email}");

            final productRequest = ProductReuqest(
              category: selectedProduct?.id ?? "",
              description: descriptionController.text,
              location: user?.location ?? [0, 0],
              isProductNeededForExchange: isExchangeChecked,
              quantity: int.parse(quantityController.text),
              unit: selectedQuantityType,
              userId: user?.id ?? "",
              createdAt: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now().toIso8601String(),
            );

            // Call the method to create a new product
            ref
                .read(newProductsNotifierProvider.notifier)
                .createProduct(productRequest);
          }
        },
        child: const Text('Submit'),
      ),
    );
  }
}
