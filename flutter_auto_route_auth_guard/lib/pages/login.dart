import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_auto_route_test/utils/auth_services.dart';
import '../routes/routes.gr.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onResult});

  final void Function(bool)? onResult;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 100,
      width: 200,
      // child:SizedBox.shrink()
      child: ElevatedButton(
          onPressed: (() async {
            AuthService().isAuthenticated = true;
            context.router.navigate(DashboardRoute(children: [
              UserRoute(userId: 'Login successfully from login page')
            ]));
          }),
          child: Text('Click to Login')),
    ));
  }
}
