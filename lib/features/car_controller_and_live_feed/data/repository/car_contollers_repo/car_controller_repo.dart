import 'package:crazycar/core/network/remote/dio_helper/dio_helper.dart';
import 'package:crazycar/core/network/remote/end_points.dart';
import 'package:crazycar/features/car_controller_and_live_feed/data/repository/car_contollers_repo/base_car_controller_repo.dart';
import 'package:dartz/dartz.dart';

class CarControllerRepo extends BaseCarControllerRepo{
  @override
  Future<Either<String , dynamic>> carMovementDirections(
      {required int r , required int l }) async {
    try {
      var response = await DioHelper.postdata(
          endPoint: EndPoints.carMovement,
          data: {
            'r' :  r,
            'l' : l
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
  Future<Either<String, dynamic>> panTiltMovementDirections({required int pan, required int tilt}) async {
    try {
      var response = await DioHelper.postdata(
          endPoint: EndPoints.panTiltMovement,
          data: {
            'pan' :  pan,
            'tilt' : tilt
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