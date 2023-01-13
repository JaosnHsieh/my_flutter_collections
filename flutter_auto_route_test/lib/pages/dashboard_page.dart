import 'package:auto_route/auto_route.dart';
import 'package:flutter_auto_route_test/pages/post.dart';
import '../routes/routes.gr.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.router
                      .navigate(const DashboardRoute(children: [PostRoute()]));
                },
                child: Text('Post')),
            ElevatedButton(
                onPressed: (() {
                  context.router.navigate(
                      const DashboardRoute(children: [SettingsRoute()]));
                }),
                child: Text('Setting')),
            ElevatedButton(
                onPressed: () {
                  context.router
                      .navigate(const DashboardRoute(children: [UserRoute()]));
                },
                child: Text('User'))
          ],
        ),
        const Expanded(child: AutoRouter())
      ],
    );
  }
}
