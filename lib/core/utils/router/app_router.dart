import 'package:crazycar/core/services/service_locator.dart';
import 'package:crazycar/features/auth/views/signup_screen.dart';
import 'package:crazycar/features/layout/views/app_layout.dart';
import 'package:crazycar/features/auth/views/login_screen.dart';
import 'package:crazycar/features/adding_new_users/data/repository/users_tracking_repo.dart';
import 'package:crazycar/features/adding_new_users/logic/add_new_user_to_track_cubit/add_new_user_to_track_cubit.dart';
import 'package:crazycar/features/adding_new_users/views/add_new_user_to_track_screen.dart';
import 'package:crazycar/features/adding_new_users/views/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kAppLayoutView = '/appLayoutView';
  static const String kLoginView = '/LoginView';
  static const String kRegisterView = '/RegisterView';

  static const String kCameraScreen = '/cameraView';
  static const String kAddUserTrackingImagesScreen =
      '/addUserTrackingImagesView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRouter.kLoginView,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
       GoRoute(
        path: AppRouter.kRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const SignupScreen();
        },
      ),
      GoRoute(
        path: kAppLayoutView,
        builder: (BuildContext context, GoRouterState state) {
          return const AppLayout();
        },
      ),
      GoRoute(
        path: kAddUserTrackingImagesScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AddNewUserToTrackCubit(getIt.get<AddingNewUsersToTrackRepo>()),
            child: AddNewUserToTrackScreen(),
          );
        },
      ),
      GoRoute(
        path: kCameraScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider.value(
            value: state.extra as AddNewUserToTrackCubit,
            child: const CameraScreen(),
          );
        },
      ),
    ],
  );
}
