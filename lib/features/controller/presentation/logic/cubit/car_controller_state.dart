part of 'car_controller_cubit.dart';

abstract class CarControllerStates{}

 class CarControllerInitial extends CarControllerStates {}
 class ChangeCarMovementDirectionLoadingState extends CarControllerStates {}
 class ChangeCarMovementDirectionSuccessState extends CarControllerStates {}
 class ChangeCarMovementDirectionErrorState extends CarControllerStates {}
  class ChangePanTiltMovementDirectionLoadingState extends CarControllerStates {}
 class ChangePanTiltMovementDirectionSuccessState extends CarControllerStates {}
 class ChangePanTiltMovementDirectionErrorState extends CarControllerStates {}
