// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/foundation.dart' as _i24;
import 'package:flutter/material.dart' as _i23;

import '../auth/login/forgot_password/forgot_pass_otp_verification.dart'
    as _i19;
import '../auth/login/forgot_password/forgot_password.dart' as _i18;
import '../auth/login/login.dart' as _i2;
import '../auth/sign_up/category/category.dart' as _i4;
import '../auth/sign_up/emailVerification/email_verification_page.dart' as _i6;
import '../auth/sign_up/finalConfirmation/final_confirmation.dart' as _i7;
import '../auth/sign_up/phoneVerification/phone_verification_page.dart' as _i5;
import '../auth/sign_up/sign_up.dart' as _i3;
import '../core/custom_bottom_navigation_bar.dart' as _i14;
import '../core/privacy_policy.dart' as _i13;
import '../home/home.dart' as _i8;
import '../home/mobile/bookmark_screen/bookmark_page.dart' as _i21;
import '../home/mobile/interest_screen/interest_category_page.dart' as _i17;
import '../home/mobile/interest_screen/interest_page.dart' as _i12;
import '../home/mobile/notification_screen/notification_screen.dart' as _i11;
import '../home/mobile/profile_screen/profile_form.dart' as _i16;
import '../home/mobile/profile_screen/profile_page.dart' as _i9;
import '../home/mobile/search_screen/view_all_screen.dart' as _i20;
import '../home/mobile/setting_screen/setting_screen.dart' as _i10;
import '../home/web/verify_screen/verify_screen.dart' as _i15;
import '../splash_screen/splash_screen.dart' as _i1;

class AppRouter extends _i22.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      final args = routeData.argsAs<LoginPageRouteArgs>(
          orElse: () => const LoginPageRouteArgs());
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage(key: args.key));
    },
    SignUpPageRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpPageRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.SignUpPage(key: args.key, categories: args.categories));
    },
    CategoryPageRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.CategoryPage());
    },
    PhoneVerificationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PhoneVerificationScreenRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.PhoneVerificationScreen(key: args.key, email: args.email));
    },
    EmailVerificationScreenRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmailVerificationScreen());
    },
    FinalConfirmationRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FinalConfirmation());
    },
    HomePageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () =>
              HomePageRouteArgs(newID: pathParams.getString('id', "")));
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.HomePage(key: args.key, newID: args.newID));
    },
    ProfilePageRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfilePage());
    },
    SettingScreenRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SettingScreen());
    },
    NotificationScreenRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.NotificationScreen());
    },
    InterestPageRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.InterestPage());
    },
    PrivacyPolicyRoute.name: (routeData) {
      final args = routeData.argsAs<PrivacyPolicyRouteArgs>(
          orElse: () => const PrivacyPolicyRouteArgs());
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.PrivacyPolicy(key: args.key));
    },
    CustomBottomNavigationBarRoute.name: (routeData) {
      final args = routeData.argsAs<CustomBottomNavigationBarRouteArgs>(
          orElse: () => const CustomBottomNavigationBarRouteArgs());
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.CustomBottomNavigationBar(
              key: args.key, search: args.search, index: args.index));
    },
    VerifyPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<VerifyPageRouteArgs>(
          orElse: () => VerifyPageRouteArgs(token: pathParams.optString('id')));
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.VerifyPage(key: args.key, token: args.token));
    },
    ProfileFormPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileFormPageRouteArgs>(
          orElse: () => const ProfileFormPageRouteArgs());
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.ProfileFormPage(key: args.key));
    },
    InterestCategoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<InterestCategoryPageRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.InterestCategoryPage(
              myCategories: args.myCategories, key: args.key));
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.ForgotPasswordScreen());
    },
    ForgotVerificationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotVerificationScreenRouteArgs>(
          orElse: () => const ForgotVerificationScreenRouteArgs());
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i19.ForgotVerificationScreen(key: args.key));
    },
    ViewAllPageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewAllPageRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.ViewAllPage(key: args.key, title: args.title));
    },
    BookmarkPageRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.BookmarkPage());
    }
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(SplashPageRoute.name, path: '/'),
        _i22.RouteConfig(LoginPageRoute.name, path: '/login'),
        _i22.RouteConfig(SignUpPageRoute.name, path: '/signup'),
        _i22.RouteConfig(CategoryPageRoute.name, path: '/categories'),
        _i22.RouteConfig(PhoneVerificationScreenRoute.name,
            path: '/phoneVerify'),
        _i22.RouteConfig(EmailVerificationScreenRoute.name,
            path: '/emailVerify'),
        _i22.RouteConfig(FinalConfirmationRoute.name, path: '/finalStep'),
        _i22.RouteConfig(HomePageRoute.name, path: '/home/:id'),
        _i22.RouteConfig(ProfilePageRoute.name, path: '/profile'),
        _i22.RouteConfig(SettingScreenRoute.name, path: '/settings'),
        _i22.RouteConfig(NotificationScreenRoute.name, path: '/notification'),
        _i22.RouteConfig(InterestPageRoute.name, path: '/interest'),
        _i22.RouteConfig(PrivacyPolicyRoute.name, path: '/privacy_policy'),
        _i22.RouteConfig(CustomBottomNavigationBarRoute.name, path: '/main'),
        _i22.RouteConfig(VerifyPageRoute.name, path: '/verifyemail/:id'),
        _i22.RouteConfig(ProfileFormPageRoute.name, path: '/edit/profile'),
        _i22.RouteConfig(InterestCategoryPageRoute.name,
            path: '/interest/update'),
        _i22.RouteConfig(ForgotPasswordScreenRoute.name,
            path: '/forgotpassword'),
        _i22.RouteConfig(ForgotVerificationScreenRoute.name,
            path: '/updatepass'),
        _i22.RouteConfig(ViewAllPageRoute.name, path: '/viewall'),
        _i22.RouteConfig(BookmarkPageRoute.name, path: '/bookmark')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashPageRoute extends _i22.PageRouteInfo<void> {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for [_i2.LoginPage]
class LoginPageRoute extends _i22.PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({_i24.Key? key})
      : super(name, path: '/login', args: LoginPageRouteArgs(key: key));

  static const String name = 'LoginPageRoute';
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'LoginPageRouteArgs{key: $key}';
  }
}

/// generated route for [_i3.SignUpPage]
class SignUpPageRoute extends _i22.PageRouteInfo<SignUpPageRouteArgs> {
  SignUpPageRoute({_i24.Key? key, required List<String> categories})
      : super(name,
            path: '/signup',
            args: SignUpPageRouteArgs(key: key, categories: categories));

  static const String name = 'SignUpPageRoute';
}

class SignUpPageRouteArgs {
  const SignUpPageRouteArgs({this.key, required this.categories});

  final _i24.Key? key;

  final List<String> categories;

  @override
  String toString() {
    return 'SignUpPageRouteArgs{key: $key, categories: $categories}';
  }
}

/// generated route for [_i4.CategoryPage]
class CategoryPageRoute extends _i22.PageRouteInfo<void> {
  const CategoryPageRoute() : super(name, path: '/categories');

  static const String name = 'CategoryPageRoute';
}

/// generated route for [_i5.PhoneVerificationScreen]
class PhoneVerificationScreenRoute
    extends _i22.PageRouteInfo<PhoneVerificationScreenRouteArgs> {
  PhoneVerificationScreenRoute({_i24.Key? key, required String email})
      : super(name,
            path: '/phoneVerify',
            args: PhoneVerificationScreenRouteArgs(key: key, email: email));

  static const String name = 'PhoneVerificationScreenRoute';
}

class PhoneVerificationScreenRouteArgs {
  const PhoneVerificationScreenRouteArgs({this.key, required this.email});

  final _i24.Key? key;

  final String email;

  @override
  String toString() {
    return 'PhoneVerificationScreenRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for [_i6.EmailVerificationScreen]
class EmailVerificationScreenRoute extends _i22.PageRouteInfo<void> {
  const EmailVerificationScreenRoute() : super(name, path: '/emailVerify');

  static const String name = 'EmailVerificationScreenRoute';
}

/// generated route for [_i7.FinalConfirmation]
class FinalConfirmationRoute extends _i22.PageRouteInfo<void> {
  const FinalConfirmationRoute() : super(name, path: '/finalStep');

  static const String name = 'FinalConfirmationRoute';
}

/// generated route for [_i8.HomePage]
class HomePageRoute extends _i22.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({_i24.Key? key, String newID = ""})
      : super(name,
            path: '/home/:id',
            args: HomePageRouteArgs(key: key, newID: newID),
            rawPathParams: {'id': newID});

  static const String name = 'HomePageRoute';
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key, this.newID = ""});

  final _i24.Key? key;

  final String newID;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key, newID: $newID}';
  }
}

/// generated route for [_i9.ProfilePage]
class ProfilePageRoute extends _i22.PageRouteInfo<void> {
  const ProfilePageRoute() : super(name, path: '/profile');

  static const String name = 'ProfilePageRoute';
}

/// generated route for [_i10.SettingScreen]
class SettingScreenRoute extends _i22.PageRouteInfo<void> {
  const SettingScreenRoute() : super(name, path: '/settings');

  static const String name = 'SettingScreenRoute';
}

/// generated route for [_i11.NotificationScreen]
class NotificationScreenRoute extends _i22.PageRouteInfo<void> {
  const NotificationScreenRoute() : super(name, path: '/notification');

  static const String name = 'NotificationScreenRoute';
}

/// generated route for [_i12.InterestPage]
class InterestPageRoute extends _i22.PageRouteInfo<void> {
  const InterestPageRoute() : super(name, path: '/interest');

  static const String name = 'InterestPageRoute';
}

/// generated route for [_i13.PrivacyPolicy]
class PrivacyPolicyRoute extends _i22.PageRouteInfo<PrivacyPolicyRouteArgs> {
  PrivacyPolicyRoute({_i24.Key? key})
      : super(name,
            path: '/privacy_policy', args: PrivacyPolicyRouteArgs(key: key));

  static const String name = 'PrivacyPolicyRoute';
}

class PrivacyPolicyRouteArgs {
  const PrivacyPolicyRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'PrivacyPolicyRouteArgs{key: $key}';
  }
}

/// generated route for [_i14.CustomBottomNavigationBar]
class CustomBottomNavigationBarRoute
    extends _i22.PageRouteInfo<CustomBottomNavigationBarRouteArgs> {
  CustomBottomNavigationBarRoute(
      {_i24.Key? key, String search = "", int index = 0})
      : super(name,
            path: '/main',
            args: CustomBottomNavigationBarRouteArgs(
                key: key, search: search, index: index));

  static const String name = 'CustomBottomNavigationBarRoute';
}

class CustomBottomNavigationBarRouteArgs {
  const CustomBottomNavigationBarRouteArgs(
      {this.key, this.search = "", this.index = 0});

  final _i24.Key? key;

  final String search;

  final int index;

  @override
  String toString() {
    return 'CustomBottomNavigationBarRouteArgs{key: $key, search: $search, index: $index}';
  }
}

/// generated route for [_i15.VerifyPage]
class VerifyPageRoute extends _i22.PageRouteInfo<VerifyPageRouteArgs> {
  VerifyPageRoute({_i24.Key? key, required String? token})
      : super(name,
            path: '/verifyemail/:id',
            args: VerifyPageRouteArgs(key: key, token: token),
            rawPathParams: {'id': token});

  static const String name = 'VerifyPageRoute';
}

class VerifyPageRouteArgs {
  const VerifyPageRouteArgs({this.key, required this.token});

  final _i24.Key? key;

  final String? token;

  @override
  String toString() {
    return 'VerifyPageRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for [_i16.ProfileFormPage]
class ProfileFormPageRoute
    extends _i22.PageRouteInfo<ProfileFormPageRouteArgs> {
  ProfileFormPageRoute({_i24.Key? key})
      : super(name,
            path: '/edit/profile', args: ProfileFormPageRouteArgs(key: key));

  static const String name = 'ProfileFormPageRoute';
}

class ProfileFormPageRouteArgs {
  const ProfileFormPageRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'ProfileFormPageRouteArgs{key: $key}';
  }
}

/// generated route for [_i17.InterestCategoryPage]
class InterestCategoryPageRoute
    extends _i22.PageRouteInfo<InterestCategoryPageRouteArgs> {
  InterestCategoryPageRoute({required List<String> myCategories, _i24.Key? key})
      : super(name,
            path: '/interest/update',
            args: InterestCategoryPageRouteArgs(
                myCategories: myCategories, key: key));

  static const String name = 'InterestCategoryPageRoute';
}

class InterestCategoryPageRouteArgs {
  const InterestCategoryPageRouteArgs({required this.myCategories, this.key});

  final List<String> myCategories;

  final _i24.Key? key;

  @override
  String toString() {
    return 'InterestCategoryPageRouteArgs{myCategories: $myCategories, key: $key}';
  }
}

/// generated route for [_i18.ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends _i22.PageRouteInfo<void> {
  const ForgotPasswordScreenRoute() : super(name, path: '/forgotpassword');

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for [_i19.ForgotVerificationScreen]
class ForgotVerificationScreenRoute
    extends _i22.PageRouteInfo<ForgotVerificationScreenRouteArgs> {
  ForgotVerificationScreenRoute({_i24.Key? key})
      : super(name,
            path: '/updatepass',
            args: ForgotVerificationScreenRouteArgs(key: key));

  static const String name = 'ForgotVerificationScreenRoute';
}

class ForgotVerificationScreenRouteArgs {
  const ForgotVerificationScreenRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'ForgotVerificationScreenRouteArgs{key: $key}';
  }
}

/// generated route for [_i20.ViewAllPage]
class ViewAllPageRoute extends _i22.PageRouteInfo<ViewAllPageRouteArgs> {
  ViewAllPageRoute({_i24.Key? key, required String title})
      : super(name,
            path: '/viewall',
            args: ViewAllPageRouteArgs(key: key, title: title));

  static const String name = 'ViewAllPageRoute';
}

class ViewAllPageRouteArgs {
  const ViewAllPageRouteArgs({this.key, required this.title});

  final _i24.Key? key;

  final String title;

  @override
  String toString() {
    return 'ViewAllPageRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for [_i21.BookmarkPage]
class BookmarkPageRoute extends _i22.PageRouteInfo<void> {
  const BookmarkPageRoute() : super(name, path: '/bookmark');

  static const String name = 'BookmarkPageRoute';
}
