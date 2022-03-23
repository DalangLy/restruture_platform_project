// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../../features/dashboard/presentation/pages/dashboard_page.dart'
    as _i4;
import '../../../features/home/presentation/pages/home_wrapper_page.dart'
    as _i3;
import '../../../features/login/presentation/pages/login_page.dart' as _i1;
import '../../../features/register/presentation/pages/register_page.dart'
    as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    HomeWrapperRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.HomeWrapperPage(),
          transitionsBuilder: _i5.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig(RegisterRoute.name, path: '/register'),
        _i5.RouteConfig(HomeWrapperRoute.name, path: '/', children: [
          _i5.RouteConfig(DashboardRoute.name,
              path: '', parent: HomeWrapperRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.HomeWrapperPage]
class HomeWrapperRoute extends _i5.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeWrapperRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeWrapperRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '');

  static const String name = 'DashboardRoute';
}
