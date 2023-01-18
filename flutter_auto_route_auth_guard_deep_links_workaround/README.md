# flutter_auto_route_auth_guard_deep_links_workaround

Deep links, query strings, and auth guard workaround.

[auto_route](https://github.com/Milad-Akarie/auto_route_library)

[related issue](https://github.com/Milad-Akarie/auto_route_library/issues/1329)

## Run

Start android app

`flutter run -d your-android-id`

Go to home page that running the app in background.

Open another terminal and run deep link testing

```bash
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://flutterbooksample.com/#/dashboard/user?id=deepLinkworks&from=external" com.example.flutter_auto_route_test'
```

\*Currently not working with cold start, should be done via [uni_links](https://pub.dev/packages/uni_links) and passed it to `initialDeepLink` on auto_route.

## Main Code

route_guard.dart

```dart
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
```
