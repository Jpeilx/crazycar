part of 'car_options_cubit.dart';

abstract class CarOptionStates{}
final class CarOptionInitial extends CarOptionStates {}
final class ChangeCarOptionLoadingState extends CarOptionStates {}
final class ChangeCarOptionSuccessState extends CarOptionStates {}
final class ChangeCarOptionErorrState extends CarOptionStates {}
