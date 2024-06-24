part of 'tracking_users_cubit.dart';

abstract  class TrackingUsersStates {}

final class TrackingUsersInitial extends TrackingUsersStates {}
final class GetAvailableUsersToTrackLoadingState extends TrackingUsersStates {}
final class GetAvailableUsersToTrackSuccessState extends TrackingUsersStates {}
final class GetAvailableUsersToTrackErrorState extends TrackingUsersStates {}
final class SetUserToTrackLoadingState extends TrackingUsersStates {}
final class SetUserToTrackSuccessState extends TrackingUsersStates {}
final class SetUserToTrackErrorState extends TrackingUsersStates {}
