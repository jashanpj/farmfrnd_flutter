import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/services/user_cache_service/domain/providers/current_user_provider.dart';
import 'package:flutter_project/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_project/shared/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';

class DashboardDrawer extends ConsumerWidget {
  const DashboardDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider).asData?.value;

    return SafeArea(
      bottom: false,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              ),
              accountName: Text(
                '${currentUser?.fullName}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              accountEmail: Text(
                '${currentUser?.email}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              currentAccountPicture: const CircleAvatar(
                  // backgroundImage: NetworkImage('${currentUser?.image}'),
                  ),
              otherAccountsPictures: [
                InkWell(
                  onTap: () async {
                    await ref.read(userLocalRepositoryProvider).deleteUser();
                    // ignore: use_build_context_synchronously
                    AutoRouter.of(context).pushAndPopUntil(
                      LoginRoute(),
                      predicate: (_) => false,
                    );
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.logout,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ref.read(appThemeProvider.notifier).toggleTheme();
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Theme.of(context).brightness == Brightness.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Home",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Divider(
                      color: Colors.grey.shade300, height: 40, thickness: 1),
                  Text(
                    "My Account",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Divider(
                      color: Colors.grey.shade300,
                      height: 40,
                      thickness: 1), // Uses Divider instead of border
                  Text(
                    "About Farmfrnd",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Divider(
                      color: Colors.grey.shade300, height: 40, thickness: 1),
                  Text(
                    "Learn farming with us",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Divider(
                      color: Colors.grey.shade300, height: 40, thickness: 1),
                  Text(
                    "Contact us",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
