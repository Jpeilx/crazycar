import 'package:dartz/dartz.dart';

abstract class BaseCarOptionsRepo {
   Future<Either<String, dynamic>> changeCarControllerOptions({required String  option});
}