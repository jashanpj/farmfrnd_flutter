// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BuyRoute.name: (routeData) {
      final args = routeData.argsAs<BuyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BuyScreen(
          key: args.key,
          categoryId: args.categoryId,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    ExchangeRoute.name: (routeData) {
      final args = routeData.argsAs<ExchangeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExchangeScreen(
          key: args.key,
          categoryId: args.categoryId,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    SellRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SellScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [BuyScreen]
class BuyRoute extends PageRouteInfo<BuyRouteArgs> {
  BuyRoute({
    Key? key,
    required String categoryId,
    List<PageRouteInfo>? children,
  }) : super(
          BuyRoute.name,
          args: BuyRouteArgs(
            key: key,
            categoryId: categoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'BuyRoute';

  static const PageInfo<BuyRouteArgs> page = PageInfo<BuyRouteArgs>(name);
}

class BuyRouteArgs {
  const BuyRouteArgs({
    this.key,
    required this.categoryId,
  });

  final Key? key;

  final String categoryId;

  @override
  String toString() {
    return 'BuyRouteArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExchangeScreen]
class ExchangeRoute extends PageRouteInfo<ExchangeRouteArgs> {
  ExchangeRoute({
    Key? key,
    required String categoryId,
    List<PageRouteInfo>? children,
  }) : super(
          ExchangeRoute.name,
          args: ExchangeRouteArgs(
            key: key,
            categoryId: categoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'ExchangeRoute';

  static const PageInfo<ExchangeRouteArgs> page =
      PageInfo<ExchangeRouteArgs>(name);
}

class ExchangeRouteArgs {
  const ExchangeRouteArgs({
    this.key,
    required this.categoryId,
  });

  final Key? key;

  final String categoryId;

  @override
  String toString() {
    return 'ExchangeRouteArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SellScreen]
class SellRoute extends PageRouteInfo<void> {
  const SellRoute({List<PageRouteInfo>? children})
      : super(
          SellRoute.name,
          initialChildren: children,
        );

  static const String name = 'SellRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
