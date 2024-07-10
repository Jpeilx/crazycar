

import 'package:crazycar/features/car_controller_and_live_feed/data/repository/TrackingUsersRebo/base_tracking_users_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'tracking_users_state.dart';

class TrackingUsersCubit extends Cubit<TrackingUsersStates> {
  BaseTrackingUsersRepo trackingUsersRepo ; 
  static TrackingUsersCubit get(context)=> BlocProvider.of(context) ;


  List<dynamic> availableUserToTrackIds =[1,2 , 3 , 4] ;
  TrackingUsersCubit(this.trackingUsersRepo) : super(TrackingUsersInitial());
   Future<void> getAvailableUserToTrack() async {
    emit(GetAvailableUsersToTrackLoadingState());
    var response =
        await trackingUsersRepo.getAvailableUsersToTrack();
    response.fold((failure) {
      emit(GetAvailableUsersToTrackErrorState());
    }, (availableUserToTrackIds) {
      this.availableUserToTrackIds =availableUserToTrackIds ;
      emit(GetAvailableUsersToTrackSuccessState());
    });
  }
  String trackedUser ='0' ;
  Future<void> setUserToTrack({required String  id }) async {
     trackedUser = id ; 
    emit(SetUserToTrackLoadingState());
    var response =
        await trackingUsersRepo.specifyTrackingUser(id: id);
    response.fold((failure) {
      trackedUser ='0' ;
      emit(SetUserToTrackErrorState());
    }, (message) {
     
      emit(SetUserToTrackSuccessState());
    });
  }
  Future<void> searchAboutUserToTrack({required String name  }) async {
    emit(SearchAboutUrerToTrackLoadingState());
    var response =
        await trackingUsersRepo.searchAboutUserToTrack(name: name );
    response.fold((failure) {
      emit(SearchAboutUrerToTrackErrorState());
    }, (message) {
      trackedUser = name ;
      emit(SearchAboutUrerToTrackSuccessState());
    });
  }
}
