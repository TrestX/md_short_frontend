import 'package:freezed_annotation/freezed_annotation.dart';

part 'see_fewer_failure.freezed.dart';

@freezed
abstract class SeeFewerFailure with _$SeeFewerFailure {
  const factory SeeFewerFailure.cancelledByUser() = CancelledByUser;
  const factory SeeFewerFailure.serverError() = ServerError;
}
