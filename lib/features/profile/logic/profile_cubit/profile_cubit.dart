import 'dart:io';

import 'package:crazycar/features/profile/data/repository/base_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  BaseProfileRepo profilRepo;
  ProfileCubit(this.profilRepo) : super(PersonalCenterInitial());

  static ProfileCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  String? imageUser;
  pickImageUser(String? pathImage) {
    imageUser = pathImage;
    emit(PersonalCenterInitial());
  }

  removeUserPickedImage() {
    imageUser = null;
    emit(PersonalCenterInitial());
  }


  Future<void> getProfileData() async {
    emit(GetProfileDataLoadingState());
    var response = await profilRepo.getProfileData();
    response.fold((failure) {
      emit(GetProfileDataErrorState(
          ''));
    }, (userProfilData) {
     

      emit(GetProfileDataSuccessState());
    });
  }

  Future<void> updateProfileData({
    required String name,
    required String nickname,
    required String email,
    required String phoneNumber,
    required String phoneCountryId,
    required String countryId,
    required File? avatar,
  }) async {
    emit(UpdateProfileDataLoadingState());
    // var response = await profilRepo.updateProfileData(
    //     name: name,
    //     nickname: nickname,
    //     email: email,
    //     phoneNumber: phoneNumber,
    //     phoneCountryId: phoneCountryId,
    //     countryId: countryId,
    //     avatar: avatar);
    // response.fold((failure) {
    //   emit(UpdateProfileDataErrorState(
    //       NetworkExceptions.getErrorMessage(failure as NetworkExceptions)));
    // }, (message) {
    //   emit(UpdateProfileDataSuccessState(message));
    // });
  }

  Future<void> updatePasswordData({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(UpdatePasswordLoadingState());
    // var response = await profilRepo.changePassword(
    //     oldPassword: oldPassword,
    //     newPassword: newPassword,
    //     confirmPassword: confirmPassword);
    // response.fold((failure) {
    //   emit(UpdatePasswordErrorState(
    //       NetworkExceptions.getErrorMessage(failure as NetworkExceptions)));
    // }, (message) {
    //   emit(UpdatePasswordSuccessState(message));
    // });
  }

  
}
