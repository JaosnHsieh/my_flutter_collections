import 'package:auto_route/auto_route.dart';
import 'package:flutter_auto_route_test/pages/post.dart';
import '../routes/routes.gr.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
        routes: [
          UserRoute(userId: '3'),
          const PostRoute(),
          const SettingsRoute(),
        ],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            appBar: AppBar(
                title: Text(context.topRoute.name),
                leading: AutoLeadingButton()),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                    label: 'User', icon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: 'Post', icon: Icon(Icons.article)),
                BottomNavigationBarItem(
                    label: 'Settings', icon: Icon(Icons.settings)),
              ],
            ),
          );
        });
  }
}
