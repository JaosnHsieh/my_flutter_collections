// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/dashboard_page.dart' as _i2;
import '../pages/login.dart' as _i1;
import '../pages/post.dart' as _i4;
import '../pages/settings.dart' as _i5;
import '../pages/user.dart' as _i3;
import 'route_guard.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter({
    _i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.LoginPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    UserRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UserRouteArgs>(
          orElse: () => UserRouteArgs(
                  userId: queryParams.getString(
                'id',
                'default',
              )));
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.UserPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    PostRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PostPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i6.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          guards: [authGuard],
          children: [
            _i6.RouteConfig(
              UserRoute.name,
              path: 'user',
              parent: DashboardRoute.name,
            ),
            _i6.RouteConfig(
              PostRoute.name,
              path: 'posts',
              parent: DashboardRoute.name,
            ),
            _i6.RouteConfig(
              SettingsRoute.name,
              path: 'settings',
              parent: DashboardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i7.Key? key,
    void Function(bool)? onResult,
  }) : super(
          LoginRoute.name,
          path: '/login',
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onResult,
  });

  final _i7.Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.UserPage]
class UserRoute extends _i6.PageRouteInfo<UserRouteArgs> {
  UserRoute({
    _i7.Key? key,
    String userId = 'default',
  }) : super(
          UserRoute.name,
          path: 'user',
          args: UserRouteArgs(
            key: key,
            userId: userId,
          ),
          rawQueryParams: {'id': userId},
        );

  static const String name = 'UserRoute';
}

class UserRouteArgs {
  const UserRouteArgs({
    this.key,
    this.userId = 'default',
  });

  final _i7.Key? key;

  final String userId;

  @override
  String toString() {
    return 'UserRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i4.PostPage]
class PostRoute extends _i6.PageRouteInfo<void> {
  const PostRoute()
      : super(
          PostRoute.name,
          path: 'posts',
        );

  static const String name = 'PostRoute';
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsRoute';
}
