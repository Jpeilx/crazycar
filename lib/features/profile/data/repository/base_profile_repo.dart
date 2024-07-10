import 'package:dartz/dartz.dart';

abstract class BaseProfileRepo {
  
   Future<Either<String, dynamic>> getProfileData();
}