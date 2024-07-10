import 'package:dartz/dartz.dart';

abstract class BaseNotificationsRepo {
  Future<Either<String, dynamic>> getNotifications() ;
}