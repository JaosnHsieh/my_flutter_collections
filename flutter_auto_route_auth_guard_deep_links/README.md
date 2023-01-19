# flutter_auto_route_auth_guard_deep_links

Deep links, query strings, and auth guard with [auto_route](https://github.com/Milad-Akarie/auto_route_library) and [uni_link](https://github.com/avioli/uni_links).

## Run

Start android app `flutter run -d your-android-id`

Try 2 test cases:

1. Cold start

2. Running in the background(Open and jump to homepage)

Open another terminal and run the following bash adb command:

### android app link

```bash
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://flutterbooksample.com/#/dashboard/user?id=deepLinkworks&from=external" com.example.flutter_auto_route_test'
```

### android deep link

```bash
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "logrckt://flutterbooksample.com/#/dashboard/user?id=deepLinkworks&from=external" com.example.uni_links_example'
```

## references

https://github.com/Milad-Akarie/auto_route_library/issues/461

https://github.com/avioli/uni_links/tree/master/uni_links

https://github.com/himanshusharma89/uni_links_example

https://blog.logrocket.com/understanding-deep-linking-flutter-uni-links/

https://developer.android.com/training/app-links

## Main Code

main.dart

```dart
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_auto_route_test/routes/route_guard.dart';
import 'package:flutter_auto_route_test/routes/routes.gr.dart';
import 'package:flutter_auto_route_test/utils/auth_services.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  runApp(MyApp());
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

```
