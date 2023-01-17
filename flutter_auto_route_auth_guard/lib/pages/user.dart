import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_route_test/utils/auth_services.dart';

class UserPage extends StatelessWidget {
  final String userId;
  const UserPage({super.key, @QueryParam('id') this.userId = 'default'});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('UserPage ${userId}'),
        SizedBox(
          width: 100,
          height: 100,
          child: ElevatedButton(
              onPressed: () {
                AuthService().isAuthenticated = false;
              },
              child: Text('Logout')),
        )
      ],
    );
  }
}

// adb shell am start -a android.intent.action.VIEW \
//     -c android.intent.category.BROWSABLE \
//     -d "http://flutterbooksample.com/#/dashboard/user?id=deepLinkworks" \
//     com.example.flutter_auto_route_test