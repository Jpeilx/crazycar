import 'package:crazycar/features/controller/data/repository/car_controller_repo.dart';
import 'package:crazycar/features/car_leader/data/repository/car_options_repo.dart';
import 'package:crazycar/features/users_tracking/data/repository/users_tracking_repo.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerLazySingleton<CarControllerRepo>(() => CarControllerRepo());
  getIt.registerLazySingleton<UsersTrackingRepo>(() => UsersTrackingRepo());
  getIt.registerLazySingleton<CarOptionsRepo>(() => CarOptionsRepo());
 
 
}
