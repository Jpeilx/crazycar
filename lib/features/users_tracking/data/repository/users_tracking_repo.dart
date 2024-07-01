import 'dart:io';
import 'dart:typed_data';

import 'package:crazycar/core/network/remote/dio_helper/dio_helper.dart';
import 'package:crazycar/core/network/remote/end_points.dart';
import 'package:crazycar/features/users_tracking/data/repository/base_users_tracking_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UsersTrackingRepo extends BaseUsersTrackingRepo{
  @override
  Future<Either<String, List<dynamic>>> getAvailableUsersToTrack() async {
   try {
      var response = await DioHelper.getdata(
          endPoint: EndPoints.getAvailableUsersToTrack,
         
         );
       print(response.data);
        return Right(response.data);
     
    } catch (error) {
      print(error);
      return Left('Error');
    }
  }
  

  @override
  Future<Either<String, dynamic>> specifyTrackingUser({required int  id}) async {
     try {
      var response = await DioHelper.postdata(
          endPoint: EndPoints.setTrackingUSer,
          data: {
            'id':  id 
          }
         
         );
       print(response.data);
        return Right(response.data);
     
    } catch (error) {
      print(error);
      return Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> sendVideoFrame({required Uint8List encodedFrame}) async {
  try {
    var response = await DioHelper.postVideoFrame(
      endPoint: EndPoints.sendVideoStramFrame,
      data: MultipartFile.fromBytes(
        encodedFrame,
        filename: 'frame.jpg', // Ensure a filename is provided
      //  contentType:  MediaType('image', 'jpeg'), // Set content type
      ),
    );
    print(response.data);
    return Right(response.data);
  } catch (error) {
    print(error);
    return Left('Error');
  }
}
    Future<Either<String, dynamic>> addNewUserToTrack() async {
    try {
      var response = await DioHelper.postdata(
          endPoint: EndPoints.setCarOption,
          data: {
            'opt':'n'
          }
         );
       print(response.data);
        return Right(response.data);
     
    } catch (error) {
      print(error);
      return Left('Error');
    }
  }
}