import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String userId;
  const UserPage({super.key, @QueryParam('id') this.userId = 'default'});

  @override
  Widget build(BuildContext context) {
    return Text('UserPage ${userId}');
  }
}
