import 'dart:io';


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
  Future<Either<String, dynamic>> specifyTrackingUser({required String   id}) async {
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
  Future<Either<String, dynamic>> sendVideoFrame({required File  encodedFrame}) async {
  try {
    var response = await DioHelper.postVideoFrame(
      endPoint: EndPoints.sendVideoStramFrame,
      data: FormData.fromMap({'file' : await  MultipartFile.fromFile(
        encodedFrame.path 
      ),}) 
    );
    print(response.data);
    return Right(response.data);
  } catch (error) {
    print(error);
    return Left('Error');
  }
}
@override
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
  
  @override
  Future<Either<String, dynamic>> searchAboutUserToTrack({required String name}) async {
    try {
      var response = await DioHelper.postdata(
          endPoint: EndPoints.searchAboutUserToTrack,
          data: {
            'name':name 
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