part of 'profile_cubit.dart';

@immutable
abstract class ProfileStates {}

class PersonalCenterInitial extends ProfileStates {}

class GetProfileDataLoadingState extends ProfileStates {}

class GetProfileDataSuccessState extends ProfileStates {}

class GetProfileDataErrorState extends ProfileStates {
  final String message;
  GetProfileDataErrorState(this.message);
}

class UpdateProfileDataLoadingState extends ProfileStates {}

class UpdateProfileDataSuccessState extends ProfileStates {
  final String message;
  UpdateProfileDataSuccessState(this.message);
}

class UpdateProfileDataErrorState extends ProfileStates {
  final String message;
  UpdateProfileDataErrorState(this.message);
}

class UpdatePasswordLoadingState extends ProfileStates {}

class UpdatePasswordSuccessState extends ProfileStates {
  final String message;
  UpdatePasswordSuccessState(this.message);
}

class UpdatePasswordErrorState extends ProfileStates {
  final String message;
  UpdatePasswordErrorState(this.message);
}
