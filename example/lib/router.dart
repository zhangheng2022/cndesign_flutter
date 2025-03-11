import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/home/home.dart';
import 'package:example/ui/widgets/button/button.dart';
import 'package:example/ui/widgets/icon/icon.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: 'button',
        path: '/button',
        builder: (context, state) => const ButtonPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: 'icon',
        path: '/icon',
        builder: (context, state) => const IconPage(),
      ),
    ],
  );
}
