part of 'notifications_cubit.dart';

abstract class NotificationsStates {}
class IntialNotificationsState extends NotificationsStates {}
class GetNotificationsLoadingState extends NotificationsStates{}
class GetNotificationsSuccessState extends NotificationsStates{}
class GetNotificationsErrorState extends NotificationsStates{}