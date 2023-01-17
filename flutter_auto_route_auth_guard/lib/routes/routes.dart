import 'package:auto_route/annotations.dart';
import 'package:flutter_auto_route_test/routes/route_guard.dart';
import '../pages/dashboard_page.dart';
import '../pages/login.dart';
import '../pages/post.dart';
import '../pages/settings.dart';
import '../pages/user.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/login', page: LoginPage),
    AutoRoute(
        path: '/dashboard',
        page: DashboardPage,
        initial: true,
        children: [
          // RedirectRoute(path: '', redirectTo: 'user'),
          AutoRoute(path: 'user', page: UserPage),
          AutoRoute(path: 'posts', page: PostPage),
          AutoRoute(path: 'settings', page: SettingsPage)
        ],
        guards: [
          AuthGuard
        ]),
  ],
)
class $AppRouter {}
