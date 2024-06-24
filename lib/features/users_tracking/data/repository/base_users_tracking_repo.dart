import 'package:dartz/dartz.dart';

abstract class BaseUsersTrackingRepo {
    Future<Either<String, List<dynamic>>> getAvailableUsersToTrack();
    Future<Either<String,dynamic>> specifyTrackingUser({required int id });


}