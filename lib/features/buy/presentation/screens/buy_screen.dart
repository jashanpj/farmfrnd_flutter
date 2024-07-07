import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/buy/presentation/providers/buy_state_provider.dart';
import 'package:flutter_project/features/buy/presentation/widgets/product_list.dart';
import 'package:flutter_project/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/state/buy_state.dart';

@RoutePage()
class BuyScreen extends ConsumerStatefulWidget {
  static const String routeName = 'BuyScreen';

  const BuyScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends ConsumerState<BuyScreen> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  bool isSearchActive = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(buyNotifierProvider.notifier);
      if (isSearchActive) {
        // notifier.searchProducts(searchController.text);
      } else {
        notifier.fetchProducts();
      }
    }
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(buyNotifierProvider);

    ref.listen(
      buyNotifierProvider.select((value) => value),
      ((BuyState? previous, BuyState next) {
        //show Snackbar on failure
        if (next.state == BuyConcreteState.fetchedAllProducts) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }
      }),
    );
    return Scaffold(
      appBar: AppBar(
        title: isSearchActive
            ? TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                controller: searchController,
                onChanged: _onSearchChanged,
              )
            : const Text('FarmFrnd'),
        actions: [
          IconButton(
            onPressed: () {
              searchController.clear();
              setState(() {
                isSearchActive = !isSearchActive;
              });

              ref.read(buyNotifierProvider.notifier).resetState();
              if (!isSearchActive) {
                ref.read(buyNotifierProvider.notifier).fetchProducts();
              }
              refreshScrollControllerListener();
            },
            icon: Icon(
              isSearchActive ? Icons.clear : Icons.search,
            ),
          ),
        ],
      ),
      drawer: const DashboardDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Always show MenuColumn at the top
          const SizedBox(height: 20),

          Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Buy Products",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Nourish Your Community — Buy Fresh, Buy Local",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              )),
          const SizedBox(height: 10),
          Flexible(
            fit: FlexFit.loose,
            child: state.state == BuyConcreteState.loading
                ? const Center(child: CircularProgressIndicator())
                : state.hasData
                    ? Column(
                        children: [
                          ProductList(
                            scrollController: scrollController,
                            productList: state.productsList,
                          ),
                          if (state.state == BuyConcreteState.fetchingMore)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // call api
                                  final notifier =
                                      ref.read(buyNotifierProvider.notifier);
                                  notifier.fetchProducts();
                                },
                                child: const Text('Refresh'),
                              ),
                            ],
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  _onSearchChanged(String query) {
    // if (_debounce?.isActive ?? false) _debounce?.cancel();
    // _debounce = Timer(const Duration(milliseconds: 500), () {
    //   ref.read(buyNotifierProvider.notifier).searchProducts(query);
    // });
  }
}
