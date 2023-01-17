# flutter_auto_route_test

Testing out Auth Guard with `AutoRedirectGuard`, `onNavigation` in [auto_route](https://github.com/Milad-Akarie/auto_route_library).

## Run

watch

`flutter pub run build_runner watch`

run

`flutter run -d chrome`

## Demo

![demo](demo.gif 'demo')

## Main Code

route_guard.dart

```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter_auto_route_test/utils/auth_services.dart';
import 'package:flutter_auto_route_test/routes/routes.gr.dart';

class AuthGuard extends AutoRedirectGuard {
  AuthService authService;
  AuthGuard(this.authService) {
    authService.addListener(() {
      reevaluate();
      print('AuthGuard changed');
    });
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    print('canNavigate');
    return authService.isAuthenticated;
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print(
        'onNavigation authService.isAuthenticated ${authService.isAuthenticated}');
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (authService.isAuthenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.push(LoginRoute(onResult: (success) {
        // if success == true the navigation will be resumed
        // else it will be aborted
        resolver.next(success);
      }));
    }
  }
}

```

auth_services.dart

```dart
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  AuthService._();
  static final AuthService _singleton = AuthService._();
  factory AuthService() {
    return _singleton;
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool value) {
    print('AuthService set isAuthenticated');
    _isAuthenticated = value;
    notifyListeners();
  }
}

```
