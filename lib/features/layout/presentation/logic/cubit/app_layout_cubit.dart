import 'package:crazycar/features/controller/presentation/views/car_controller_and_live_screen.dart';
import 'package:crazycar/features/layout/presentation/logic/cubit/app_layout_states.dart';
import 'package:crazycar/features/users_traking/presentation/views/tracked_users_screen.dart';
import 'package:crazycar/features/qr_code/presentatin/ui/qr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());
  static AppLayoutCubit get(context) => BlocProvider.of(context);
  int currentButtomNavIndex = 0;
  List<Widget> supermarketScreens = [
    QRView() ,
    CarControllerAndLiveScreen() ,
    TrackedUsersScreen()
  ];
  void changeButtonNavItem(int index) {
    currentButtomNavIndex = index;
    emit(ChangeButtomNavItemState());
  }
}
