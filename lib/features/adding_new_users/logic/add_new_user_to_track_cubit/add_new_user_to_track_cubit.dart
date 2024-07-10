
import 'dart:io';
import 'package:crazycar/features/adding_new_users/data/repository/base_users_tracking_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_new_user_to_track_states.dart';

class AddNewUserToTrackCubit extends Cubit<AddNewUserToTrackStates> {
  BaseAddingNewUsersToTrackRepo addingNewUserToTrackRepo ;
  static AddNewUserToTrackCubit get(context) => BlocProvider.of(context) ;
  AddNewUserToTrackCubit(this.addingNewUserToTrackRepo) : super(AddNewUserToTrackInitialState());

  
Future<void> sendVideoStreamFrame({required File encodedFrame}) async {
  emit(SendVideoFrameLoadingState());
  var response = await addingNewUserToTrackRepo.sendVideoFrame(encodedFrame: encodedFrame);
  response.fold((failure) {
    emit(SendVideoFrameErrorState());
  }, (message) {
    emit(SendVideoFrameSuccessState());
  });
}

  Future<void> addnewUserToTrack() async {
    emit(AddNewUserToTrackLoadingState());
    var response =
        await addingNewUserToTrackRepo.addNewUserToTrackOption();
    response.fold((failure) {
      emit(AddNewUserToTrackErrorState());
    }, (message) {
      emit(AddNewUserToTrackSuccessState());
    });
  }
  Future<void> addNewUserToTrackData({required String  id ,required String name  }) async {
    emit(AddNewUserDataToTrackLoadingState());
    var response =
        await addingNewUserToTrackRepo.addNewUserToTrackData(id: id , name:  name );
    response.fold((failure) {
      emit(AddNewUserDataToTrackErrorState());
    }, (message) {
      emit(AddNewUserDataToTrackSuccessState());
    });
  }
}
