import 'dart:async';

import 'package:MD_Shorts/domain/category/category.dart';
import 'package:MD_Shorts/domain/category/category_failure.dart';
import 'package:MD_Shorts/domain/category/i_category_repository.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'searchcategory_event.dart';
part 'searchcategory_state.dart';
part 'searchcategory_bloc.freezed.dart';

@injectable
class SearchcategoryBloc extends Bloc<SearchcategoryEvent, SearchcategoryState> {
  final ICategoryRepository _categoryRepository;
  SearchcategoryBloc(this._categoryRepository)
      : super(const SearchcategoryState.initial());
  StreamSubscription<Either<CategoryFailure, List<UserCategory>>>?
      _categoryStreamSubscription;
  @override
  Stream<SearchcategoryState> mapEventToState(
    SearchcategoryEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        yield const SearchcategoryState.loadInProgress();
        await _categoryStreamSubscription?.cancel();
        String id;
        List<String> ids;
        ids = await ProfileNotifier().getCategories();
        id = ids.join(",");
        _categoryStreamSubscription = _categoryRepository
            .getAllCategory(id)
            .listen((event) => add(SearchcategoryEvent.valueReceived(event)));
      },
      valueReceived: (_ValueReceived value) async* {
        yield value.failureOrValue.fold(
          (f) => SearchcategoryState.loadFailure(f),
          (value) => SearchcategoryState.loadSuccess(value),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _categoryStreamSubscription?.cancel();
    return super.close();
  }
}