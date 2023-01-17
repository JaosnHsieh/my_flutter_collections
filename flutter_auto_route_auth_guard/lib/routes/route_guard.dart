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
        'onNavigation authService.isAuthenticated ${authService.isAuthenticated} router.currentUrl ${router.currentUrl}');
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (authService.isAuthenticated) {
      // if user is authenticated we continue
      resolver.next(true);
      // router.pushNamed(router.currentUrl);
    } else {
      // we redirect the user to our login page
      router.push(LoginRoute(onResult: (success) {
        // if success == true the navigation will be resumed
        // else it will be aborted
        resolver.next(success);
        router.removeLast();
      }));
    }
  }
}
