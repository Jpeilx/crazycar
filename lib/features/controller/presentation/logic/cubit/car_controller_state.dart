part of 'car_controller_cubit.dart';

abstract class CarControllerStates{}

 class CarControllerInitial extends CarControllerStates {}
 class ChangeCarMovementDirectionLoadingState extends CarControllerStates {}
 class ChangeCarMovementDirectionSuccessState extends CarControllerStates {}
 class ChangeCarMovementDirectionErrorState extends CarControllerStates {}
