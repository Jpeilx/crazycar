import 'package:crazycar/core/services/service_locator.dart';
import 'package:crazycar/features/layout/presentation/views/app_layout.dart';
import 'package:crazycar/features/login/presentation/views/login_screen.dart';
import 'package:crazycar/features/users_tracking/data/repository/users_tracking_repo.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/video_streaming_cubit/video_streaming_cubit.dart';
import 'package:crazycar/features/users_tracking/presentation/views/add_user_tracking_images.dart';import 'package:crazycar/features/users_tracking/presentation/views/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kAppLayoutView = '/appLayoutView';

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
        path: kAppLayoutView,
        builder: (BuildContext context, GoRouterState state) {
          return const AppLayout();
        },
      ),
       GoRoute(
        path: kAddUserTrackingImagesScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const AddUserTrackingImagesScreen();
        },
      ),
      GoRoute(
        path: kCameraScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => VideoStreamingCubit(getIt.get<UsersTrackingRepo>()),
            child: const CameraScreen(),
          );
        },
      ),
    ],
  );
}
