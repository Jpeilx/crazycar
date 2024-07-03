import 'package:crazycar/features/controller/data/repository/base_car_controller_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'car_controller_state.dart';

class CarControllerCubit extends Cubit<CarControllerStates> {
  BaseCarControllerRepo carControllerRepo ; 
 static  CarControllerCubit get(context)=> BlocProvider.of(context) ;
  CarControllerCubit(this.carControllerRepo) : super(CarControllerInitial());


  Future<void> carMovementDirection({required int r , required int l } ) async {
    print(r);
    print(l);
    emit(ChangeCarMovementDirectionLoadingState());
    var response =
        await carControllerRepo.carMovementDirections(r: r, l: l);
    response.fold((failure) {
      emit(ChangeCarMovementDirectionErrorState());
    }, (loginModel) {
      emit(ChangeCarMovementDirectionSuccessState());
    });
  }

  Future<void> changePanTiltMovementDirections({required int pan  , required int tilt } ) async {
   
    emit(ChangePanTiltMovementDirectionLoadingState());
    var response =
        await carControllerRepo.panTiltMovementDirections(pan: pan, tilt: tilt);
    response.fold((failure) {
      emit(ChangePanTiltMovementDirectionErrorState());
    }, (loginModel) {
      emit(ChangePanTiltMovementDirectionSuccessState());
    });
  }
  
}
