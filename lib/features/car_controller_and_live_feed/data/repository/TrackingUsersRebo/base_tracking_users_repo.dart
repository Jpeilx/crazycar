import 'package:dartz/dartz.dart';

abstract class BaseTrackingUsersRepo {
  Future<Either<String, List<dynamic>>> getAvailableUsersToTrack();
  Future<Either<String, dynamic>> specifyTrackingUser({required String id});
  Future<Either<String, dynamic>> searchAboutUserToTrack(
      {required String name});
}
