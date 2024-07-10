part of 'add_new_user_to_track_cubit.dart';

abstract class AddNewUserToTrackStates {}

final class AddNewUserToTrackInitialState extends AddNewUserToTrackStates {}
final class SendVideoFrameLoadingState extends AddNewUserToTrackStates {}
final class SendVideoFrameErrorState extends AddNewUserToTrackStates {}
final class SendVideoFrameSuccessState extends AddNewUserToTrackStates {}
final class AddNewUserToTrackLoadingState extends AddNewUserToTrackStates {}
final class AddNewUserToTrackErrorState extends AddNewUserToTrackStates {}
final class AddNewUserToTrackSuccessState extends AddNewUserToTrackStates {}
final class AddNewUserDataToTrackLoadingState  extends AddNewUserToTrackStates {}
final class AddNewUserDataToTrackSuccessState extends AddNewUserToTrackStates {}
final class AddNewUserDataToTrackErrorState extends AddNewUserToTrackStates {}