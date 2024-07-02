
import 'package:crazycar/core/network/remote/dio_helper/dio_helper.dart';
import 'package:crazycar/core/network/remote/end_points.dart';
import 'package:crazycar/core/shared/repositories/notifications_repo/base_notifications_repo.dart';
import 'package:dartz/dartz.dart';

class NotificationsRepo extends BaseNotificationsRepo {
   @override
  Future<Either<String, dynamic>> getNortifications() async {
  try {
    var response = await DioHelper.getdata(endPoint: EndPoints.getNotifications ) ;
    print(response.data);
    return Right(response.data);
  } catch (error) {
    print(error);
    return Left('Error');
  }
}
}