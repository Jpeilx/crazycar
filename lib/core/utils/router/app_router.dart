import 'package:crazycar/features/layout/presentation/views/app_layout.dart';
import 'package:crazycar/features/login/presentation/views/login_screen.dart';
import 'package:crazycar/features/users_traking/presentation/logic/edit_upload_images_cubit/edit_upload_images_cubit.dart';
import 'package:crazycar/features/users_traking/presentation/views/add_user_tracking_images.dart';
import 'package:crazycar/features/users_traking/presentation/views/pager_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kAppLayoutView = '/appLayoutView';
  static const String kPagerImagesView = '/pagerImagesView';
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
          return BlocProvider(
            create: (context) => EditUploadImagesCubit(),
            child: const AddUserTrackingImagesScreen(),
          );
        },
      ),
      GoRoute(
        path: kPagerImagesView,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return BlocProvider<EditUploadImagesCubit>.value(
            value:  data['cubit'] as  EditUploadImagesCubit, 
            child: PagerImages(
              initIndex: data['initIndex'],
              procesEdit: data['procesEdit'],
            ),
          );
        },
      ),
    ],
  );
}
