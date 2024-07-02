import 'dart:io';


import 'package:dartz/dartz.dart';

abstract class BaseUsersTrackingRepo {
    Future<Either<String, List<dynamic>>> getAvailableUsersToTrack();
    Future<Either<String,dynamic>> specifyTrackingUser({required String  id });
    Future<Either<String,dynamic>> sendVideoFrame({required File   encodedFrame});
    Future<Either<String,dynamic>> addNewUserToTrack();
    Future<Either<String,dynamic>> searchAboutUserToTrack({required String name });


}