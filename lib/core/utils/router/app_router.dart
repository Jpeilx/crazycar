import 'package:crazycar/features/layout/presentation/ui/app_layout.dart';
import 'package:crazycar/features/login/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kAppLayoutView = '/AppLayoutView';
 
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
       GoRoute(
        path: AppRouter.kAppLayoutView,
        builder: (BuildContext context, GoRouterState state) {
          return const AppLayout();
        },
      ),
      
    ],
  );
}
