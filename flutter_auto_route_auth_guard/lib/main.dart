import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_auto_route_test/routes/route_guard.dart';
import 'package:flutter_auto_route_test/routes/routes.gr.dart';
import 'package:flutter_auto_route_test/utils/auth_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter(authGuard: AuthGuard(AuthService()));
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(_appRouter,
          navigatorObservers: () => [MyObserver()],
          initialDeepLink: '/dashboard/user?id=frominitialDeepLink'),
    );
  }
}

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
