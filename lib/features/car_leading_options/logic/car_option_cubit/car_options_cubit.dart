

import 'package:crazycar/core/constant/app_constance.dart';
import 'package:crazycar/features/car_leading_options/data/repository/base_car_options_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_options_state.dart';

class CarOptionsCubit extends Cubit<CarOptionStates> {
  BaseCarOptionsRepo carOptionsRepo ;
  static CarOptionsCubit get(context)=> BlocProvider.of(context) ;
  CarOptionsCubit(this.carOptionsRepo) : super(CarOptionInitial());
  
   Future<void> changeCarControllerOption(String  option) async {
     AppConstance. carControllerOption = option ;
    emit(ChangeCarOptionLoadingState());
    var response =
        await carOptionsRepo.changeCarControllerOptions(option: option);
    response.fold((failure) {
      emit(ChangeCarOptionErorrState());
    }, (loginModel) {
    
      emit(ChangeCarOptionSuccessState());
    });
  }
}
