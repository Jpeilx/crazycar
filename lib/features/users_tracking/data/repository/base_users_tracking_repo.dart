import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';

abstract class BaseUsersTrackingRepo {
    Future<Either<String, List<dynamic>>> getAvailableUsersToTrack();
    Future<Either<String,dynamic>> specifyTrackingUser({required int id });
    Future<Either<String,dynamic>> sendVideoFrame({required Uint8List  encodedFrame});
    Future<Either<String,dynamic>> addNewUserToTrack();


}