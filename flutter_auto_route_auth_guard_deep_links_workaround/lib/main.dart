import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_auto_route_test/routes/route_guard.dart';
import 'package:flutter_auto_route_test/routes/routes.gr.dart';
import 'package:flutter_auto_route_test/utils/auth_services.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter(authGuard: AuthGuard(AuthService()));
  Uri? initialUri;
  void _initDeepLinks() {
    getInitialUri().then((value) {
      initialUri = value;
    }).catchError((error) {
      log(error);
    });
    getUriLinksStream().listen((Uri? uri) {
      if (uri != null) {
        _appRouter.pushNamed(uri.path);
      }
      // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });
  }

  MyApp({super.key}) {
    _initDeepLinks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(initialDeepLink: initialUri?.path),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
