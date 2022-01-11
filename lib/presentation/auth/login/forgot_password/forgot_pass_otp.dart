import 'package:MD_Shorts/application/otp/bloc/otpreq_bloc.dart';
import 'package:MD_Shorts/application/otp/form/otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPassOTPVerification extends StatelessWidget {
  final formKey;
  ForgotPassOTPVerification({Key? key, required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaWidth = widthGetMethod(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: mediaWidth,
          child: MediaQuery.of(context).size.width > 768
              ? Card(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07),
                  child: Content(mediaWidth: mediaWidth, formKey: formKey),
                )
              : Content(mediaWidth: mediaWidth, formKey: formKey),
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
  const Content({Key? key, required this.mediaWidth, required this.formKey})
      : super(key: key);
  final formKey;
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    return SingleChildScrollView(
      child: BlocBuilder<OtpreqBloc, OtpreqState>(
        builder: (context, state) {
          return Padding(
            padding: MediaQuery.of(context).size.width > 768
                ? const EdgeInsets.all(150.0)
                : const EdgeInsets.only(
                    top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Reset Password",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF015397)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter the code we just sent you on your registered mobile number.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: Form(
                      child: PinCodeTextField(
                          appContext: context,
                          length: 4,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            inactiveColor: Colors.black,
                            fieldHeight: 40,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          onChanged: (val) => {
                                context
                                    .read<OtpreqBloc>()
                                    .add(OtpreqEvent.changeOtp(val)),
                              }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Didn't receive any code?"),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () async {
                        context
                            .read<OtpreqBloc>()
                            .add(OtpreqEvent.resendOtp(""));
                      },
                      child: RichText(
                        text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: 'RESEND',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF015397),
                            ),
                          )
                        ]),
                        textAlign: TextAlign.start,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "New Password*",
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(8),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          passwordController.text = value;
                          context
                              .read<OtpreqBloc>()
                              .add(OtpreqEvent.changePpassword(value));
                        },
                        validator: (value) => context
                            .read<OtpreqBloc>()
                            .state
                            .password
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                shortLength: (_) =>
                                    'Password should be greater than 8 characters',
                                dontContainDigit: (_) =>
                                    'Password should be contain a digit',
                                dontContainLower: (_) =>
                                    'Password should be contain a lower case character',
                                dontContainUpper: (_) =>
                                    'Password should be contain a upper case character',
                                empty: (_) =>
                                    'Password should be greater than 8 characters.It should contain a lower case character. aupper case character and a digit',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Confirm Password*",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: mediaWidth,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true, // Added this
                            contentPadding: EdgeInsets.all(8),
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            context.read<OtpreqBloc>().add(
                                OtpreqEvent.passwordVerified(
                                    state.password.isValid() &&
                                        state.password.getOrCrash() == value));
                          },
                          validator: (value) {
                            context.read<OtpreqBloc>().add(
                                OtpreqEvent.passwordVerified(
                                    state.password.isValid() &&
                                        state.password.getOrCrash() == value));
                            if (!state.password.isValid() ||
                                state.password.getOrCrash() != value) {
                              return "Password doesn't match";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: BlocBuilder<OtpBloc, OtpState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () => {
                                  context.read<OtpreqBloc>().add(
                                      OtpreqEvent.verifyPassOtp(
                                          state.otp, passwordController.text)),
                                },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF015397),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width > 500
                                      ? mediaWidth * 0.5
                                      : mediaWidth,
                                  40),
                            ),
                            child: const Text("Update Password",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
