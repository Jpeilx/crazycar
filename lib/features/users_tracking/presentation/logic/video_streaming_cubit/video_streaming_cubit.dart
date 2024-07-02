
import 'dart:io';
import 'package:crazycar/features/users_tracking/data/repository/base_users_tracking_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'video_streaming_state.dart';

class VideoStreamingCubit extends Cubit<VideoStreamingStates> {
  BaseUsersTrackingRepo usersTrackingRepo ;
  static VideoStreamingCubit get(context) => BlocProvider.of(context) ;
  VideoStreamingCubit(this.usersTrackingRepo) : super(VideoStreamingInitial());

  
Future<void> sendVideoStreamFrame({required File encodedFrame}) async {
  emit(SendVideoFrameLoadingState());
  var response = await usersTrackingRepo.sendVideoFrame(encodedFrame: encodedFrame);
  response.fold((failure) {
    emit(SendVideoFrameErrorState());
  }, (message) {
    emit(SendVideoFrameSuccessState());
  });
}

  Future<void> addnewUserToTrack() async {
    emit(AddNewUserToTrackLoadingState());
    var response =
        await usersTrackingRepo.addNewUserToTrack();
    response.fold((failure) {
      emit(AddNewUserToTrackErrorState());
    }, (message) {
      emit(AddNewUserToTrackSuccessState());
    });
  }
}
