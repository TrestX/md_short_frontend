import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_failure.freezed.dart';

@freezed
abstract class BookmarkFailure with _$BookmarkFailure {
  const factory BookmarkFailure.cancelledByUser() = CancelledByUser;
  const factory BookmarkFailure.serverError() = ServerError;
}
