part of 'video_streaming_cubit.dart';

abstract class VideoStreamingStates {}

final class VideoStreamingInitial extends VideoStreamingStates {}
final class SendVideoFrameLoadingState extends VideoStreamingStates {}
final class SendVideoFrameErrorState extends VideoStreamingStates {}
final class SendVideoFrameSuccessState extends VideoStreamingStates {}
final class AddNewUserToTrackLoadingState extends VideoStreamingStates {}
final class AddNewUserToTrackErrorState extends VideoStreamingStates {}
final class AddNewUserToTrackSuccessState extends VideoStreamingStates {}

