import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_route_test/utils/auth_services.dart';

class UserPage extends StatelessWidget {
  final String userId;
  final String deepLinkWorkAroundQueryString;
  const UserPage(
      {super.key,
      @QueryParam('id')
          this.userId = 'default',
      @QueryParam('deepLinkWorkAroundQueryString')
          this.deepLinkWorkAroundQueryString = 'internal'});

  @override
  Widget build(BuildContext context) {
    print('UserPage userId ${userId}');
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: ElevatedButton(
              onPressed: () {
                AuthService().isAuthenticated = false;
              },
              child: Text('Logout')),
        ),
        Container(
          width: 300,
          height: 100,
          color: Colors.blueAccent,
          child: Text(
            'userId "${userId}"',
          ),
        )
      ],
    );
  }
}
