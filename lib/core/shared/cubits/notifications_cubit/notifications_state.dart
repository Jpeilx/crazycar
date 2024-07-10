part of 'notifications_cubit.dart';

abstract class NotificationsStates {}
class IntialNotificationsState extends NotificationsStates {}
class GetNotificationsLoadingState extends NotificationsStates{}
class GetNotificationsSuccessState extends NotificationsStates{
  String message ; 
  GetNotificationsSuccessState(this.message) ;
}
class GetNotificationsErrorState extends NotificationsStates{}