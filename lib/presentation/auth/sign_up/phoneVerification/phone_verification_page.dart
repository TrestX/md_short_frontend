import 'package:MD_Shorts/application/otp/bloc/otpreq_bloc.dart';
import 'package:MD_Shorts/application/otp/form/otp_bloc.dart';
import 'package:MD_Shorts/injection.dart';
import 'package:MD_Shorts/presentation/auth/sign_up/phoneVerification/phone_verification.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneVerificationScreen extends StatelessWidget {

  const PhoneVerificationScreen({Key? key,required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    var mediaWidth = widthGetMethod(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Center(
        child: SizedBox(
          width: mediaWidth,
          child: MediaQuery.of(context).size.width > 768
              ? Card(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07),
                  child: Content(mediaWidth: mediaWidth,email:email),
                )
              : Content(mediaWidth: mediaWidth,email:email),
        ),
      ),
    );
  }

  double widthGetMethod(BuildContext context) {
    return MediaQuery.of(context).size.width > 768
        ? 768
        : MediaQuery.of(context).size.width;
  }
}

class Content extends StatelessWidget {
  final double mediaWidth;
  final String email;
  const Content({Key? key, required this.mediaWidth,required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<OtpBloc>(
            create: (context) => getIt<OtpBloc>(),
          ),
          BlocProvider<OtpreqBloc>(
            create: (context) => getIt<OtpreqBloc>(),
          ),
        ],
        child: BlocConsumer<OtpreqBloc, OtpreqState>(
          listener: (context, state) {
            state.emailotpFailureOrSuccessOption.fold(
              () {},
          (either) => either.fold(
              (failure) => FlushbarHelper.createError(
                      message: failure.map(
                    cancelledByUser: (_) => 'Cancelled',
                    serverError: (_) => 'Server error',
                    emailAlreadyRegistered: (_) =>
                        'Email or Phone number already exist',
                    emailNotRegistered: (_) => 'Invalid credentials',
                    emailNotVerified: (_) => 'Email not verified',
                    invalidCredentails: (_) =>
                        'unable to verify email: unauthorized user',
                  )).show(context),
              (_) => context.router.popAndPush(HomePageRoute())),
            );
          },
          builder: (context, state) {
            return PhoneVerification(email:email);
          },
        ),
      ),
    );
  }
}
