part of 'news_display_bloc.dart';

@freezed
class NewsDisplayEvent with _$NewsDisplayEvent {
  const factory NewsDisplayEvent.changeShowBottomBar() = _ChangeShowBottomBar;
  const factory NewsDisplayEvent.changePage(pageNum) = _ChangePage;
  const factory NewsDisplayEvent.changesourceName(source) = _ChangeSourceName;
  const factory NewsDisplayEvent.changeurl(url) = _ChangeUrl;
}
