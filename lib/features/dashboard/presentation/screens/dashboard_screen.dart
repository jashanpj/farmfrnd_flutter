import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/presentation/providers/dashboard_state_provider.dart';
import 'package:flutter_project/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:flutter_project/features/dashboard/presentation/widgets/category_grid.dart';
import 'package:flutter_project/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter_project/features/dashboard/presentation/widgets/menu_column.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  static const String routeName = 'DashboardScreen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
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
      final notifier = ref.read(dashboardNotifierProvider.notifier);
      if (isSearchActive) {
        // notifier.searchProducts(searchController.text);
      } else {
        notifier.fetchCategories();
      }
    }
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardNotifierProvider);

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
            : const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              searchController.clear();
              setState(() {
                isSearchActive = !isSearchActive;
              });

              ref.read(dashboardNotifierProvider.notifier).resetState();
              if (!isSearchActive) {
                ref.read(dashboardNotifierProvider.notifier).fetchCategories();
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
          const MenuColumn(),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Top Categories",
                style: Theme.of(context).textTheme.displayLarge,
              )),
          const SizedBox(height: 10),
          Flexible(
            fit: FlexFit.loose,
            child: state.state == DashboardConcreteState.loading
                ? const Center(child: CircularProgressIndicator())
                : state.hasData
                    ? Column(
                        children: [
                          CategoryGrid(
                            scrollController: scrollController,
                            categoryList: state.categoryList,
                          ),
                          if (state.state ==
                              DashboardConcreteState.fetchingMore)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0),
                          child: Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
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
    //   ref.read(dashboardNotifierProvider.notifier).searchProducts(query);
    // });
  }
}
