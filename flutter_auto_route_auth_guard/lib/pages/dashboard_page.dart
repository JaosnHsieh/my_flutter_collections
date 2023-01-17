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
        PostRoute(),
        SettingsRoute(),
        UserRoute(userId: '3'),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Row(
          children: [
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.router.navigate(
                          const DashboardRoute(children: [PostRoute()]));
                    },
                    child: Text(
                        'Post${tabsRouter.activeIndex == 0 ? '        ' : ''}')),
                ElevatedButton(
                    onPressed: (() {
                      context.router.navigate(
                          const DashboardRoute(children: [SettingsRoute()]));
                    }),
                    child: Text(
                        'Setting${tabsRouter.activeIndex == 1 ? '        ' : ''}')),
                ElevatedButton(
                    onPressed: () {
                      context.router.navigate(
                          DashboardRoute(children: [UserRoute(userId: '2')]));
                    },
                    child: Text(
                        'User${tabsRouter.activeIndex == 2 ? '        ' : ''}'))
              ],
            ),
            Expanded(child: child)
          ],
        );
      },
    );
  }
}
