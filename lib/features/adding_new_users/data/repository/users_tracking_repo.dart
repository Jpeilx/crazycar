import 'dart:io';


import 'package:crazycar/core/network/remote/dio_helper/dio_helper.dart';
import 'package:crazycar/core/network/remote/end_points.dart';
import 'package:crazycar/features/adding_new_users/data/repository/base_users_tracking_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AddingNewUsersToTrackRepo extends BaseAddingNewUsersToTrackRepo{
  

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
  Future<Either<String, dynamic>> addNewUserToTrackData({required String id, required String name}) async {
    try {
      var response = await DioHelper.postdata(
          endPoint: EndPoints.setNewPersonToTrackData,
          data: {
            'id': id , 
            'name' : name
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
    Future<Either<String, dynamic>> addNewUserToTrackOption() async {
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