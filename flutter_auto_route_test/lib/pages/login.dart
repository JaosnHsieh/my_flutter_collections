import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../routes/routes.gr.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() async {
          // context.router.navigate(const UserRoute());

          // await context.router.push(const DashboardRoute());
          // context.router.navigate(const UserRoute());
          context.router
              .navigate(const DashboardRoute(children: [UserRoute()]));
        }),
        child: Text('go to user route'));
  }
}
