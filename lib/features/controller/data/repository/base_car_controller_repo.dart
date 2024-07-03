import 'package:dartz/dartz.dart';

abstract class BaseCarControllerRepo {
  Future<Either<String, dynamic>> carMovementDirections({required int r , required int l });
  Future<Either<String, dynamic>> panTiltMovementDirections({required int pan , required int tilt });
}
