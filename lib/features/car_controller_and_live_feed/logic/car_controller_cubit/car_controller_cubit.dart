import 'package:crazycar/core/constant/app_constance.dart';
import 'package:crazycar/features/car_controller_and_live_feed/data/repository/car_contollers_repo/base_car_controller_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'car_controller_state.dart';

class CarControllerCubit extends Cubit<CarControllerStates> {
  BaseCarControllerRepo carControllerRepo;
  static CarControllerCubit get(context) => BlocProvider.of(context);
  CarControllerCubit(this.carControllerRepo) : super(CarControllerInitial());

  Future<void> carMovementDirection({required int r, required int l}) async {
    emit(ChangeCarMovementDirectionLoadingState());
    var response = await carControllerRepo.carMovementDirections(r: r, l: l);
    response.fold((failure) {
      emit(ChangeCarMovementDirectionErrorState());
    }, (message) {
      emit(ChangeCarMovementDirectionSuccessState());
    });
  }

  Future<void> changePanTiltMovementDirections(
      {required int pan, required int tilt}) async {
    emit(ChangePanTiltMovementDirectionLoadingState());
    var response =
        await carControllerRepo.panTiltMovementDirections(pan: pan, tilt: tilt);
    response.fold((failure) {
      emit(ChangePanTiltMovementDirectionErrorState());
    }, (message) {
      emit(ChangePanTiltMovementDirectionSuccessState());
    });
  }

  void joystickMapper(double x, double y) {
    double l = 0, r = 0;
    if (x < 0 && y <= 0) {
      l = 199;
      r = (-1 * 0.24) * ((x * 100).round() * (-1.0)) + 99;
    } else if (x < 0 && y > 0) {
      l = 0.24 * (y * 100).round() + 125;
      r = 49;
    } else if (x > 0 && y <= 0) {
      l = ((y * 100).round() * (-1.0));
      l = 0.24 * l + 175;
      r = 99;
    } else if (x > 0 && y > 0) {
      l = 149;
      r = -0.24 * (x * 100).round() + 49;
    } else if (x == 0 && y == 0) {
      l = 101;
      r = 1;
      carMovementDirection(r: r.round(), l: l.round());
      carMovementDirection(r: r.round(), l: l.round());
      carMovementDirection(r: r.round(), l: l.round());
      carMovementDirection(r: r.round(), l: l.round());
      carMovementDirection(r: r.round(), l: l.round());
    }
    carMovementDirection(r: r.round(), l: l.round());
  }

  void panTiltMapper(double x, double y) {
    if (x > 0 && y > 0) {
      if (AppConstance.pan <= 88) {
        AppConstance.pan += 2;
      }
      if (AppConstance.tilt >= 7) {
        AppConstance.tilt -= 2;
      }

      changePanTiltMovementDirections(
          pan: AppConstance.pan, tilt: AppConstance.tilt);
    } else if (x < 0 && y > 0) {
      if (AppConstance.pan >= -88) {
        AppConstance.pan -= 2;
      }

      if (AppConstance.tilt >= 7) {
        AppConstance.tilt -= 2;
      }
      changePanTiltMovementDirections(
          pan: AppConstance.pan, tilt: AppConstance.tilt);
    } else if (x > 0 && y < 0) {
      if (AppConstance.pan <= 88) {
        AppConstance.pan += 2;
      }
      if (AppConstance.tilt <= 88) {
        AppConstance.tilt += 2;
      }
      changePanTiltMovementDirections(
          pan: AppConstance.pan, tilt: AppConstance.tilt);
    } else if (x < 0 && y < 0) {
      if (AppConstance.pan >= -88) {
        AppConstance.pan -= 2;
      }
      if (AppConstance.tilt <= 88) {
        AppConstance.tilt += 2;
      }
      changePanTiltMovementDirections(
          pan: AppConstance.pan, tilt: AppConstance.tilt);
    }
  }
}
