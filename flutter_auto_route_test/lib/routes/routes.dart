import 'package:auto_route/annotations.dart';
import '../pages/dashboard_page.dart';
import '../pages/login.dart';
import '../pages/post.dart';
import '../pages/settings.dart';
import '../pages/user.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/dashboard', page: DashboardPage, children: [
      // RedirectRoute(path: '', redirectTo: 'user'),
      AutoRoute(path: 'user', page: UserPage),
      AutoRoute(path: 'posts', page: PostPage),
      AutoRoute(path: 'settings', page: SettingsPage)
    ]),
    AutoRoute(path: '/login', page: LoginPage, initial: true)
  ],
)
class $AppRouter {}
