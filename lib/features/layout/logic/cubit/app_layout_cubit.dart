import 'package:crazycar/core/services/service_locator.dart';
import 'package:crazycar/features/car_controller_and_live_feed/data/repository/TrackingUsersRebo/tracking_users_repo.dart';
import 'package:crazycar/features/car_controller_and_live_feed/data/repository/car_contollers_repo/car_controller_repo.dart';
import 'package:crazycar/features/car_controller_and_live_feed/logic/car_controller_cubit/car_controller_cubit.dart';
import 'package:crazycar/features/car_controller_and_live_feed/views/car_controller_and_live_screen.dart';
import 'package:crazycar/features/layout/logic/cubit/app_layout_states.dart';
import 'package:crazycar/features/car_leading_options/data/repository/car_options_repo.dart';
import 'package:crazycar/features/car_leading_options/logic/car_option_cubit/car_options_cubit.dart';
import 'package:crazycar/features/profile/data/repository/profile_repo.dart';
import 'package:crazycar/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:crazycar/features/profile/views/profile_screen.dart';
import 'package:crazycar/features/adding_new_users/data/repository/users_tracking_repo.dart';
import 'package:crazycar/features/car_controller_and_live_feed/logic/tracking_users_cubit/tracking_users_cubit.dart';
import 'package:crazycar/features/adding_new_users/logic/add_new_user_to_track_cubit/add_new_user_to_track_cubit.dart';
import 'package:crazycar/features/adding_new_users/views/add_new_user_to_track_screen.dart';
import 'package:crazycar/features/car_leading_options/views/car_leading_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());
  static AppLayoutCubit get(context) => BlocProvider.of(context);
  int currentButtomNavIndex = 0;
  List<Widget> supermarketScreens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CarOptionsCubit(getIt.get<CarOptionsRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              CarControllerCubit(getIt.get<CarControllerRepo>()),
        ),
      ],
      child: const CarLeadingOptionsScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CarControllerCubit(getIt.get<CarControllerRepo>()),
        ),
       BlocProvider(
        create: (context) => TrackingUsersCubit(getIt.get<TrackingUsersRepo>())
        ..getAvailableUserToTrack(),
        ),
      ],
      child: const CarControllerAndLiveScreen(),
    ),
    BlocProvider(
      create: (context) => AddNewUserToTrackCubit(getIt.get<AddingNewUsersToTrackRepo>()),
      child: AddNewUserToTrackScreen(),
    ) ,
    BlocProvider(
      create: (context) => ProfileCubit(getIt.get<ProfileRepo>()),
      child: const  ProfileScreen(),
    )
  ];
  void changeButtonNavItem(int index) {
    currentButtomNavIndex = index;
    emit(ChangeButtomNavItemState());
  }
}
