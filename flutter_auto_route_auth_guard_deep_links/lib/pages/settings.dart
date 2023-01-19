import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('SettingsPage router context.router ${context.router}');
    return Column(
      children: [
        const Text('SettingsPage'),
        SizedBox(
          width: 200,
          height: 200,
          child: ElevatedButton(
            child: Text('To user with id xxx'),
            onPressed: () {
              context.router.popUntilRoot();
              context.router
                  .navigateNamed('/dashboard/user?id=from-settings-page');
            },
          ),
        )
      ],
    );
  }
}
