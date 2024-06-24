

import 'package:crazycar/features/users_tracking/data/repository/base_users_tracking_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tracking_users_state.dart';

class TrackingUsersCubit extends Cubit<TrackingUsersStates> {
  BaseUsersTrackingRepo usersTrackingRepo ; 
  static TrackingUsersCubit get(context)=> BlocProvider.of(context) ;


  List<dynamic> availableUserToTrackIds =[] ;
  TrackingUsersCubit(this.usersTrackingRepo) : super(TrackingUsersInitial());
   Future<void> getAvailableUserToTrack() async {
    emit(GetAvailableUsersToTrackLoadingState());
    var response =
        await usersTrackingRepo.getAvailableUsersToTrack();
    response.fold((failure) {
      emit(GetAvailableUsersToTrackErrorState());
    }, (availableUserToTrackIds) {
      this.availableUserToTrackIds =availableUserToTrackIds ;
      emit(GetAvailableUsersToTrackSuccessState());
    });
  }
  Future<void> setUserToTrack({required int id }) async {
    emit(SetUserToTrackLoadingState());
    var response =
        await usersTrackingRepo.specifyTrackingUser(id: id);
    response.fold((failure) {
      emit(SetUserToTrackErrorState());
    }, (message) {
      emit(SetUserToTrackSuccessState());
    });
  }
}
