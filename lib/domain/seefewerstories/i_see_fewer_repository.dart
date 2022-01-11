import 'package:dartz/dartz.dart';
import 'see_fewer.dart';
import 'see_fewer_failure.dart';

abstract class ISeeFewerRepository {
  Future<Either<SeeFewerFailure,SeeFewer>> addSeeFewer(String? sourceName);
}
