import 'package:crazycar/core/services/service_locator.dart';
import 'package:crazycar/features/controller/data/repository/car_controller_repo.dart';
import 'package:crazycar/features/controller/presentation/logic/cubit/car_controller_cubit.dart';
import 'package:crazycar/features/controller/presentation/views/car_controller_and_live_screen.dart';
import 'package:crazycar/features/layout/presentation/logic/cubit/app_layout_states.dart';
import 'package:crazycar/features/qr_code/data/repository/car_options_repo.dart';
import 'package:crazycar/features/qr_code/presentatin/logic/car_option_cubit/car_options_cubit.dart';
import 'package:crazycar/features/users_tracking/data/repository/users_tracking_repo.dart';
import 'package:crazycar/features/users_tracking/presentation/logic/tracking_users_cubit/tracking_users_cubit.dart';
import 'package:crazycar/features/users_tracking/presentation/views/tracked_users_screen.dart';
import 'package:crazycar/features/qr_code/presentatin/views/qr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());
  static AppLayoutCubit get(context) => BlocProvider.of(context);
  int currentButtomNavIndex = 0;
  List<Widget> supermarketScreens = [
    BlocProvider(
      create: (context) => CarOptionsCubit(getIt.get<CarOptionsRepo>()),
      child: const QRView(),
    ),
    BlocProvider(
      create: (context) => CarControllerCubit(getIt.get<CarControllerRepo>()),
      child: const CarControllerAndLiveScreen(),
    ),
    BlocProvider(
      create: (context) => TrackingUsersCubit(getIt.get<UsersTrackingRepo>())
        ..getAvailableUserToTrack(),
      child: const TrackedUsersScreen(),
    )
  ];
  void changeButtonNavItem(int index) {
    currentButtomNavIndex = index;
    emit(ChangeButtomNavItemState());
  }
}
