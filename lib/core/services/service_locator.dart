import 'package:crazycar/core/shared/repositories/notifications_repo/notifications_repo.dart';
import 'package:crazycar/features/car_controller_and_live_feed/data/repository/TrackingUsersRebo/tracking_users_repo.dart';
import 'package:crazycar/features/car_controller_and_live_feed/data/repository/car_contollers_repo/car_controller_repo.dart';
import 'package:crazycar/features/car_leading_options/data/repository/car_options_repo.dart';
import 'package:crazycar/features/profile/data/repository/profile_repo.dart';
import 'package:crazycar/features/adding_new_users/data/repository/users_tracking_repo.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerLazySingleton<CarControllerRepo>(() => CarControllerRepo());
  getIt.registerLazySingleton<TrackingUsersRepo>(() => TrackingUsersRepo());
  getIt.registerLazySingleton<AddingNewUsersToTrackRepo>(() => AddingNewUsersToTrackRepo());
  getIt.registerLazySingleton<CarOptionsRepo>(() => CarOptionsRepo());
  getIt.registerLazySingleton<NotificationsRepo>(() => NotificationsRepo());
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo());
 
 
}
