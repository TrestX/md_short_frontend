import 'package:MD_Shorts/application/otp/bloc/otpreq_bloc.dart';
import 'package:MD_Shorts/application/otp/form/otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerification extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String email;
  PhoneVerification({Key? key,required this.email}) : super(key: key);

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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: MediaQuery.of(context).size.width > 768
                ? const EdgeInsets.all(200.0)
                : const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Verification",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF015397)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Enter the 4-digit code sent to your email ID ${"*" * (email.length-13)} ${email.substring(email.length-13,email.length)}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: BlocBuilder<OtpBloc, OtpState>(
                    builder: (context, state) {
                      return Form(
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
                                      .read<OtpBloc>()
                                      .add(OtpEvent.changeOtp(val)),
                                }),
                      );
                    },
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
                          .add(OtpreqEvent.resendOtp(email));
                    },
                    child: RichText(
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF015397),
                          ),
                        )
                      ]),
                      textAlign: TextAlign.start,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: BlocBuilder<OtpBloc, OtpState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () => {
                                context
                                    .read<OtpreqBloc>()
                                    .add(OtpreqEvent.verifyEmailOtp(state.otp, email)),
                              },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[300],
                            shape: const StadiumBorder(),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width > 500
                                    ? mediaWidth * 0.5
                                    : mediaWidth*0.45,
                                40),
                          ),
                          child: Text("Continue",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600,color:Colors.grey.shade800)));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
