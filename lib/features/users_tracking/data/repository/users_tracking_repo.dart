import 'package:crazycar/core/network/remote/dio_helper/dio_helper.dart';
import 'package:crazycar/core/network/remote/end_points.dart';
import 'package:crazycar/features/users_tracking/data/repository/base_users_tracking_repo.dart';
import 'package:dartz/dartz.dart';

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
}