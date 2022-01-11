
import 'package:MD_Shorts/application/otp/bloc/otpreq_bloc.dart';
import 'package:MD_Shorts/application/otp/form/otp_bloc.dart';
import 'package:MD_Shorts/injection.dart';
import 'package:MD_Shorts/presentation/auth/login/forgot_password/forgot_pass_otp.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotVerificationScreen extends StatelessWidget {
  ForgotVerificationScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
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
                  child: Content(mediaWidth: mediaWidth,            formKey: _formKey,),
                )
              : Content(mediaWidth: mediaWidth,            formKey: _formKey,),
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
  final formKey;
  Content({Key? key, required this.mediaWidth,required this.formKey}) : super(key: key);
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
            state.otpFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    message: failure.map(
                      cancelledByUser: (_) => 'Cancelled',
                      serverError: (_) => 'An error occured !',
                    ),
                  ).show(context);
                  context.router.popAndPush(LoginPageRoute());
                },
                (resp) {
                  if (resp.message == "password updated successfully") {
                    FlushbarHelper.createSuccess(
                            message: "Password updated successfully")
                        .show(context);
                    context.router.popAndPush(LoginPageRoute());
                  }
                  if (resp.message == "OTP sent successfully") {
                    FlushbarHelper.createSuccess(
                            message: "OTP sent successfully")
                        .show(context);
                  }
                },
              ),
            );
          },
          builder: (context, state) {
            return ForgotPassOTPVerification(            formKey: formKey);
          },
        ),
      ),
    );
  }
}
