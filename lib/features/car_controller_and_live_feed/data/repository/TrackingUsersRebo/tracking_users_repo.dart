import 'package:crazycar/core/network/remote/dio_helper/dio_helper.dart';
import 'package:crazycar/core/network/remote/end_points.dart';
import 'package:crazycar/features/car_controller_and_live_feed/data/repository/TrackingUsersRebo/base_tracking_users_repo.dart';
import 'package:dartz/dartz.dart';

class TrackingUsersRepo extends BaseTrackingUsersRepo {
  @override
  Future<Either<String, List<dynamic>>> getAvailableUsersToTrack() async {
    try {
      var response = await DioHelper.getdata(
        endPoint: EndPoints.getAvailableUsersToTrack,
      );
      print(response.data);
      return Right(response.data);
    } catch (error) {
      return Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> specifyTrackingUser(
      {required String id}) async {
    try {
      var response = await DioHelper.postdata(
          endPoint: EndPoints.setTrackingUSer, data: {'id': id});
      print(response.data);
      return Right(response.data);
    } catch (error) {
      return Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> searchAboutUserToTrack(
      {required String name}) async {
    try {
      var response = await DioHelper.postdata(
          endPoint: EndPoints.searchAboutUserToTrack, data: {'name': name});
      print(response.data);
      return Right(response.data);
    } catch (error) {
      print(error);
      return Left('Error');
    }
  }
}
