import 'package:MD_Shorts/application/otp/bloc/otpreq_bloc.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/src/provider.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: MediaQuery.of(context).size.width > 750
                ? const EdgeInsets.all(200)
                : const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height > 750
                      ? MediaQuery.of(context).size.height * 0.10
                      : MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                      child: Image.asset(
                    'assets/images/md_shorts.png',
                    width: 200,
                  )),
                ),
                const SizedBox(
                  height: 45,
                ),
                const Text(
                  "Forgot password ?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF015397)),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      context.router.navigate(LoginPageRoute());
                    },
                    child: RichText(
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'Already registered? ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
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
                  height: 15,
                ),
                const Text(
                  "Email*",
                  textAlign: TextAlign.right,
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
                  onChanged: (value) => {controller.text = value},
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () => {
                            context.read<OtpreqBloc>().add(
                                OtpreqEvent.passwordResetOtp(controller.text))
                          },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF015397),
                        minimumSize: Size(
                            MediaQuery.of(context).size.width > 500
                                ? MediaQuery.of(context).size.width * 0.5
                                : MediaQuery.of(context).size.width,
                            40),
                      ),
                      child: const Text("Reset Password",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
