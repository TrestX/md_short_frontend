import 'package:MD_Shorts/apis/see_fewer_api.dart';
import 'package:MD_Shorts/domain/seefewerstories/i_see_fewer_repository.dart';
import 'package:MD_Shorts/domain/seefewerstories/see_fewer.dart';
import 'package:MD_Shorts/domain/seefewerstories/see_fewer_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISeeFewerRepository)
class SeeFewerRepository implements ISeeFewerRepository {
  final SeeFewerApiClient _seeFewerApi;
  SeeFewerRepository (this._seeFewerApi);

  @override
  Future<Either<SeeFewerFailure, SeeFewer>> addSeeFewer(String? sourceName) async {
    final result = await _seeFewerApi.addToSeeFewer(sourceName);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (message) {
        return Right(message);
      },
    );
  }

}
