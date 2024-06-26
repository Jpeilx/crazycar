import 'package:crazycar/features/controller/data/repository/base_car_controller_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'car_controller_state.dart';

class CarControllerCubit extends Cubit<CarControllerStates> {
  BaseCarControllerRepo carControllerRepo ; 
 static  CarControllerCubit get(context)=> BlocProvider.of(context) ;
  CarControllerCubit(this.carControllerRepo) : super(CarControllerInitial());


  Future<void> carMovementDirection({required int r , required int l } ) async {
    emit(ChangeCarMovementDirectionLoadingState());
    var response =
        await carControllerRepo.carMovementDirection(r: r, l: l);
    response.fold((failure) {
      emit(ChangeCarMovementDirectionErrorState());
    }, (loginModel) {
      emit(ChangeCarMovementDirectionSuccessState());
    });
  }

  
}
