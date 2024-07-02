

import 'package:crazycar/core/shared/repositories/notifications_repo/base_notifications_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  BaseNotificationsRepo notificationsRepo ; 
  static  NotificationsCubit get(context) => BlocProvider.of(context);

      String ? message  ; 
  NotificationsCubit(this.notificationsRepo) : super(IntialNotificationsState());
   Future<void> getNotifications() async {
    emit(GetNotificationsLoadingState());
    var response =
        await notificationsRepo.getNortifications();
    response.fold((failure) {
      emit(GetNotificationsErrorState());
    }, (message) {
      this.message  =message  ;
      emit(GetNotificationsSuccessState());
    });
  }
}
