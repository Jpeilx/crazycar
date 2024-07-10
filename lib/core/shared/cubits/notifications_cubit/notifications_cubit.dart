

import 'package:crazycar/core/shared/repositories/notifications_repo/base_notifications_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  BaseNotificationsRepo notificationsRepo ; 
  static  NotificationsCubit get(context) => BlocProvider.of(context);
  NotificationsCubit(this.notificationsRepo) : super(IntialNotificationsState());
      
   Future<void> getNotifications() async {
    emit(GetNotificationsLoadingState());
    var response =
        await notificationsRepo.getNotifications();
    response.fold((failure) {
      emit(GetNotificationsErrorState());
    }, (message) {
      
      emit(GetNotificationsSuccessState(message));
    });
  }
}
