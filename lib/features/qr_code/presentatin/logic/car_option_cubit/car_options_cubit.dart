

import 'package:crazycar/features/qr_code/data/repository/base_car_options_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_options_state.dart';

class CarOptionsCubit extends Cubit<CarOptionStates> {
  BaseCarOptionsRepo carOptionsRepo ;
  static CarOptionsCubit get(context)=> BlocProvider.of(context) ;
  CarOptionsCubit(this.carOptionsRepo) : super(CarOptionInitial());

   Future<void> changeCarControllerOption(String option) async {
    emit(ChangeCarOptionLoadingState());
    var response =
        await carOptionsRepo.changeCarControllerOptions(controller: option);
    response.fold((failure) {
      emit(ChangeCarOptionErorrState());
    }, (loginModel) {
      emit(ChangeCarOptionSuccessState());
    });
  }
}
