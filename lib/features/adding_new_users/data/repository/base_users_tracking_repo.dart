import 'dart:io';


import 'package:dartz/dartz.dart';

abstract class BaseAddingNewUsersToTrackRepo {

    Future<Either<String,dynamic>> sendVideoFrame({required File   encodedFrame});
    Future<Either<String,dynamic>> addNewUserToTrackData({required String id , required String name });
    Future<Either<String,dynamic>> addNewUserToTrackOption();
 


}