import 'package:auto_route/auto_route.dart';
import 'package:flutter_auto_route_test/utils/auth_services.dart';
import 'package:flutter_auto_route_test/routes/routes.gr.dart';

class AuthGuard extends AutoRedirectGuard {
  bool isLoading = false;
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

  /// 2023.01.18 workaround for auto_route with deep links and query string working together
  /// In this workaround, any deep links must fill with &from=external query string
  /// adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://flutterbooksample.com/#/dashboard/user?id=deepLinkworks&from=external" com.example.flutter_auto_route_test'
  bool _getIsUseAutoRouteDeepLinkWorkaround({required StackRouter router}) {
    var re = RegExp(r"/dashboard/user");
    var reIsExternal = RegExp(r'from=external');
    var isMatch1 = re.hasMatch(router.currentUrl);
    var isMatch2 = reIsExternal.hasMatch(router.currentUrl);
    var isUse = isMatch1 && isMatch2 && isLoading == false;
    if (!isUse) {
      return isUse;
    }
    print(
        're.hasMatch(router.currentUrl) ${isMatch1} reIsExternal.hasMatch(router.currentUrl) ${isMatch2}');
    if (isUse) {
      isLoading = true;
      Future.delayed(Duration(seconds: 2)).then((value) {
        isLoading = false;
      });
      router.navigateNamed('/dashboard/user?id=fromDeepLink');
      print('onNavigation deep link router ${router}');
    }
    return isUse;
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print(
        'onNavigation authService.isAuthenticated ${authService.isAuthenticated}');
    print('onNavigation router.currentUrl ${router.currentUrl}');
    if (authService.isAuthenticated) {
      if (_getIsUseAutoRouteDeepLinkWorkaround(router: router) == false) {
        resolver.next(true);
      }
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
