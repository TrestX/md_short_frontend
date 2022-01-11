part of 'seefewerstories_bloc.dart';

@freezed
class SeefewerstoriesEvent with _$SeefewerstoriesEvent {
  const factory SeefewerstoriesEvent.addtoseefewer(String? sourceName) = _AddToSeeFewer;
}