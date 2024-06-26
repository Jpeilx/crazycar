import 'package:crazycar/core/network/remote/dio_helper/dio_helper.dart';
import 'package:crazycar/core/network/remote/end_points.dart';
import 'package:crazycar/features/controller/data/repository/base_car_controller_repo.dart';
import 'package:dartz/dartz.dart';

class CarControllerRepo extends BaseCarControllerRepo{
  @override
  Future<Either<String , dynamic>> carMovementDirection(
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
}