import 'package:crazycar/features/controller/presentation/ui/car_controller_view.dart';
import 'package:crazycar/features/layout/presentation/logic/cubit/app_layout_states.dart';
import 'package:crazycar/features/live_stream/presentation/ui/live_stream_view.dart';
import 'package:crazycar/features/qr_code/presentatin/ui/qr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());
  static AppLayoutCubit get(context) => BlocProvider.of(context);
  int currentButtomNavIndex = 0;
  List<Widget> supermarketScreens = [
    QRView() ,
    CarControllerView() ,
    LiveStreamView()
  ];
  void changeButtonNavItem(int index) {
    currentButtomNavIndex = index;
    emit(ChangeButtomNavItemState());
  }
}
