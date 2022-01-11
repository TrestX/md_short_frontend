// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'apis/auth_api.dart' as _i3;
import 'apis/bookmark_api.dart' as _i4;
import 'apis/category_api.dart' as _i5;
import 'apis/news_api.dart' as _i13;
import 'apis/notification_api.dart' as _i17;
import 'apis/otp_api.dart' as _i18;
import 'apis/profile_api.dart' as _i21;
import 'apis/see_fewer_api.dart' as _i23;
import 'apis/setting_api.dart' as _i24;
import 'apis/share_api.dart' as _i25;
import 'apis/user_news_read.dart' as _i29;
import 'apis/util_api.dart' as _i30;
import 'apis/verify_email_api.dart' as _i31;
import 'application/auth/auth_bloc.dart' as _i32;
import 'application/auth/sign_in/sign_in_bloc.dart' as _i26;
import 'application/auth/sign_up/sign_up_bloc.dart' as _i27;
import 'application/auth/socialMediaLogin/bloc/socialmedialogin_bloc.dart'
    as _i28;
import 'application/bookmark/bloc/bookmark_bloc.dart' as _i33;
import 'application/bookmark/bookmark_setter/bookmark_setter_bloc.dart' as _i34;
import 'application/category/categories_bloc.dart' as _i35;
import 'application/category/category_form/category_form_bloc.dart' as _i6;
import 'application/category/search_category_bloc/bloc/searchcategory_bloc.dart'
    as _i22;
import 'application/email_verification/bloc/emailverification_bloc.dart'
    as _i72;
import 'application/news/news_all/bloc/allnews_bloc.dart' as _i70;
import 'application/news/news_form/news_form_bloc.dart' as _i15;
import 'application/news/news_search/bloc/news_search_bloc.dart' as _i58;
import 'application/news/news_search_form/bloc/newssearchform_bloc.dart'
    as _i16;
import 'application/news/news_top_stories/bloc/newstopstories_bloc.dart'
    as _i60;
import 'application/news/news_trending/bloc/newstrending_bloc.dart' as _i61;
import 'application/news/news_watcher/news_watcher_dart_bloc.dart' as _i59;
import 'application/news_display/news_display_bloc/news_display_bloc.dart'
    as _i14;
import 'application/notification/bloc/notification_bloc.dart' as _i62;
import 'application/otp/bloc/otpreq_bloc.dart' as _i63;
import 'application/otp/form/otp_bloc.dart' as _i19;
import 'application/page_selected/page_selected_bloc.dart' as _i20;
import 'application/profile/bloc/profile_bloc.dart' as _i64;
import 'application/profile/profile_form/bloc/profile_form_bloc.dart' as _i65;
import 'application/seefewerstories/bloc/seefewerstories_bloc.dart' as _i66;
import 'application/settings/changepassword/changepassword_bloc.dart' as _i71;
import 'application/share/bloc/share_bloc.dart' as _i67;
import 'application/updatenews/bloc/updatenews_bloc.dart' as _i68;
import 'application/util/verifyemail/bloc/verifyemail_bloc.dart' as _i69;
import 'domain/auth/i_auth_facade.dart' as _i7;
import 'domain/bookmark/i_bookmark_repository.dart' as _i9;
import 'domain/category/i_category_repository.dart' as _i11;
import 'domain/email_verification/i_email_repository.dart' as _i36;
import 'domain/news/i_news_repository.dart' as _i38;
import 'domain/notification/i_notification_repository.dart' as _i40;
import 'domain/otp/i_otp_repository.dart' as _i42;
import 'domain/profile/i_profile_repository.dart' as _i46;
import 'domain/seefewerstories/i_see_fewer_repository.dart' as _i48;
import 'domain/settings/i_settings_respository.dart' as _i50;
import 'domain/share/i_share_repository.dart' as _i52;
import 'domain/update_news/i_update_news_repository.dart' as _i54;
import 'domain/util/presignedurl/i_presignedurl_repository.dart' as _i44;
import 'domain/util/verifyemail/i_verifyemail_repository.dart' as _i56;
import 'infrastructure/auth/auth_facade.dart' as _i8;
import 'infrastructure/bookmark/bookmark_repository.dart' as _i10;
import 'infrastructure/category/category_repository.dart' as _i12;
import 'infrastructure/core/injectable_module.dart' as _i73;
import 'infrastructure/email_verification/email_verification_repository.dart'
    as _i37;
import 'infrastructure/news/news_repository.dart' as _i39;
import 'infrastructure/notification/notification_repository.dart' as _i41;
import 'infrastructure/otp/otp_repository.dart' as _i43;
import 'infrastructure/profile/profile_repository.dart' as _i47;
import 'infrastructure/seefewerstories/see_fewer_repository.dart' as _i49;
import 'infrastructure/settings/settings_repository.dart' as _i51;
import 'infrastructure/share/share_repository.dart' as _i53;
import 'infrastructure/update_news/update_news_repository.dart' as _i55;
import 'infrastructure/utils/presignedurl/presignedurl_repository.dart' as _i45;
import 'infrastructure/utils/verifyemail/verifyemail_repository.dart'
    as _i57; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.AuthApiClient>(() => injectableModule.authApi);
  gh.lazySingleton<_i4.BookmarkApiClient>(() => injectableModule.bookmarkApi);
  gh.lazySingleton<_i5.CategoryApiClient>(() => injectableModule.catApi);
  gh.factory<_i6.CategoryFormBloc>(() => _i6.CategoryFormBloc());
  gh.lazySingleton<_i7.IAuthFacade>(
      () => _i8.AuthFaccade(get<_i3.AuthApiClient>()));
  gh.lazySingleton<_i9.IBookmarkRepository>(
      () => _i10.BookmarkRepository(get<_i4.BookmarkApiClient>()));
  gh.lazySingleton<_i11.ICategoryRepository>(
      () => _i12.CategoryRepository(get<_i5.CategoryApiClient>()));
  gh.lazySingleton<_i13.NewsApiClient>(() => injectableModule.newsApi);
  gh.factory<_i14.NewsDisplayBloc>(() => _i14.NewsDisplayBloc());
  gh.factory<_i15.NewsFormBloc>(() => _i15.NewsFormBloc());
  gh.factory<_i16.NewssearchformBloc>(() => _i16.NewssearchformBloc());
  gh.lazySingleton<_i17.NotificationApiClient>(() => injectableModule.notiApi);
  gh.lazySingleton<_i18.OTPApiClient>(() => injectableModule.otpApi);
  gh.factory<_i19.OtpBloc>(() => _i19.OtpBloc());
  gh.factory<_i20.PageSelectedBloc>(() => _i20.PageSelectedBloc());
  gh.lazySingleton<_i21.ProfileApiClient>(() => injectableModule.profileApi);
  gh.factory<_i22.SearchcategoryBloc>(
      () => _i22.SearchcategoryBloc(get<_i11.ICategoryRepository>()));
  gh.lazySingleton<_i23.SeeFewerApiClient>(() => injectableModule.seeFewerApi);
  gh.lazySingleton<_i24.SettingsApiClient>(
      () => injectableModule.getsettingsApi);
  gh.lazySingleton<_i25.ShareApiClient>(() => injectableModule.getshareApi);
  gh.factory<_i26.SignInBloc>(() => _i26.SignInBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i27.SignUpBloc>(() => _i27.SignUpBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i28.SocialmedialoginBloc>(
      () => _i28.SocialmedialoginBloc(get<_i7.IAuthFacade>()));
  gh.lazySingleton<_i29.UserNewsReadApiClient>(
      () => injectableModule.usernewsreadApi);
  gh.lazySingleton<_i30.UtilApiClient>(() => injectableModule.utilApi);
  gh.lazySingleton<_i31.VerifyApiClient>(() => injectableModule.verifyApi);
  gh.factory<_i32.AuthBloc>(() => _i32.AuthBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i33.BookmarkBloc>(
      () => _i33.BookmarkBloc(get<_i9.IBookmarkRepository>()));
  gh.factory<_i34.BookmarkSetterBloc>(
      () => _i34.BookmarkSetterBloc(get<_i9.IBookmarkRepository>()));
  gh.factory<_i35.CategoriesBloc>(
      () => _i35.CategoriesBloc(get<_i11.ICategoryRepository>()));
  gh.lazySingleton<_i36.IEmailVerifictionRepository>(
      () => _i37.EmailRepository(get<_i31.VerifyApiClient>()));
  gh.lazySingleton<_i38.INewsRepository>(
      () => _i39.NewsRepository(get<_i13.NewsApiClient>()));
  gh.lazySingleton<_i40.INotificationRepository>(
      () => _i41.NotificationRepository(get<_i17.NotificationApiClient>()));
  gh.lazySingleton<_i42.IOtpRepository>(
      () => _i43.OtpRepository(get<_i18.OTPApiClient>()));
  gh.lazySingleton<_i44.IPresignedUrlRepository>(
      () => _i45.PresignedUrlRepository(get<_i30.UtilApiClient>()));
  gh.lazySingleton<_i46.IProfileRepository>(
      () => _i47.ProfileRepository(get<_i21.ProfileApiClient>()));
  gh.lazySingleton<_i48.ISeeFewerRepository>(
      () => _i49.SeeFewerRepository(get<_i23.SeeFewerApiClient>()));
  gh.lazySingleton<_i50.ISettingsRepository>(
      () => _i51.SettingsRepository(get<_i24.SettingsApiClient>()));
  gh.lazySingleton<_i52.IShareRepository>(
      () => _i53.ShareRepository(get<_i25.ShareApiClient>()));
  gh.lazySingleton<_i54.IUpdateNewsRepository>(
      () => _i55.UpdateNewsRepository(get<_i29.UserNewsReadApiClient>()));
  gh.lazySingleton<_i56.IVerifyEmailRepository>(
      () => _i57.VerifyEmailRepository(get<_i30.UtilApiClient>()));
  gh.factory<_i58.NewsSearchBloc>(
      () => _i58.NewsSearchBloc(get<_i38.INewsRepository>()));
  gh.factory<_i59.NewsWatcherDartBloc>(
      () => _i59.NewsWatcherDartBloc(get<_i38.INewsRepository>()));
  gh.factory<_i60.NewstopstoriesBloc>(
      () => _i60.NewstopstoriesBloc(get<_i38.INewsRepository>()));
  gh.factory<_i61.NewstrendingBloc>(
      () => _i61.NewstrendingBloc(get<_i38.INewsRepository>()));
  gh.factory<_i62.NotificationBloc>(
      () => _i62.NotificationBloc(get<_i40.INotificationRepository>()));
  gh.factory<_i63.OtpreqBloc>(
      () => _i63.OtpreqBloc(get<_i42.IOtpRepository>()));
  gh.factory<_i64.ProfileBloc>(
      () => _i64.ProfileBloc(get<_i46.IProfileRepository>()));
  gh.factory<_i65.ProfileFormBloc>(
      () => _i65.ProfileFormBloc(get<_i46.IProfileRepository>()));
  gh.factory<_i66.SeefewerstoriesBloc>(
      () => _i66.SeefewerstoriesBloc(get<_i48.ISeeFewerRepository>()));
  gh.factory<_i67.ShareBloc>(
      () => _i67.ShareBloc(get<_i52.IShareRepository>()));
  gh.factory<_i68.UpdatenewsBloc>(
      () => _i68.UpdatenewsBloc(get<_i54.IUpdateNewsRepository>()));
  gh.factory<_i69.VerifyemailBloc>(
      () => _i69.VerifyemailBloc(get<_i56.IVerifyEmailRepository>()));
  gh.factory<_i70.AllnewsBloc>(
      () => _i70.AllnewsBloc(get<_i38.INewsRepository>()));
  gh.factory<_i71.ChangepasswordBloc>(
      () => _i71.ChangepasswordBloc(get<_i50.ISettingsRepository>()));
  gh.factory<_i72.EmailverificationBloc>(() =>
      _i72.EmailverificationBloc(get<_i36.IEmailVerifictionRepository>()));
  return get;
}

class _$InjectableModule extends _i73.InjectableModule {}
