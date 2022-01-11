import 'package:MD_Shorts/application/auth/socialMediaLogin/bloc/socialmedialogin_bloc.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:MD_Shorts/application/auth/sign_up/sign_up_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignUpContent extends StatelessWidget {
  SignUpContent({
    Key? key,
    required this.mediaWidth,
    required GlobalKey<FormState> formKey,
    required this.number,
    required this.categories,
    required this.controller,
  })  : _formKey = formKey,
        super(key: key);

  final double mediaWidth;
  final GlobalKey<FormState> _formKey;
  final PhoneNumber number;
  final TextEditingController controller;
  final List<String> categories;
  FirebaseAnalytics analytics = FirebaseAnalytics();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialmedialoginBloc, SocialmedialoginState>(
      listener: (ssContext, ssState) {
        ssState.authFailureOrSuccessOption.fold(
          () => {},
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
                        'Please accept our terms and conditions',
                  )).show(context),
              (_) => context.router.navigate(HomePageRoute())),
        );
      },
      builder: (ssContext, ssState) {
        return BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
              () => {},
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
                            'Please accept our terms and conditions',
                      )).show(context),
                  (_) => context.router.navigate(PhoneVerificationScreenRoute(
                      email: state.email.getOrCrash()))),
            );
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: mediaWidth,
                      child: MediaQuery.of(context).size.width > 768
                          ? Card(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.13),
                              child: SignUpCardContent(
                                  formKey: _formKey,
                                  mediaWidth: mediaWidth,
                                  number: number,
                                  categories: categories,
                                  controller: controller),
                            )
                          : SignUpCardContent(
                              formKey: _formKey,
                              mediaWidth: mediaWidth,
                              number: number,
                              categories: categories,
                              controller: controller),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class SignUpCardContent extends StatelessWidget {
  const SignUpCardContent({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.mediaWidth,
    required this.number,
    required this.categories,
    required this.controller,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double mediaWidth;
  final PhoneNumber number;
  final TextEditingController controller;
  final List<String> categories;

  static List<String> specialities = [
    "Allergist",
    "Anesthesiologist",
    "Cardiologist",
    "Chiropractor",
    "Dentist",
    "Dermatologist",
    "Fertility specialist",
    "Gynecologist",
    "Massage therapist",
    "Midwife",
    "Naturopath",
    "Neurologist",
    "Obstetrician",
    "Occupational therapist",
    "Oncologist",
    "Ophthalmologist",
    "Pediatrician",
    "Physical therapist",
    "Podiatrist",
    "Psychiatrist",
    "Radiologist",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: mediaWidth > 750
            ? const EdgeInsets.only(left: 150, right: 150, top: 70, bottom: 20)
            : const EdgeInsets.only(
                top: 70,
                left: 40,
                right: 40,
                bottom: 0,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign up",
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
                      text: 'Already a member? ',
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
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: mediaWidth,
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          GoogleSignIn _googleSignIn = GoogleSignIn(
                            scopes: [
                              'email',
                              'https://www.googleapis.com/auth/contacts.readonly',
                            ],
                          );
                          final GoogleSignInAccount? googleUser =
                              await _googleSignIn.signIn();

                          // Obtain the auth details from the request
                          final GoogleSignInAuthentication? googleAuth =
                              await googleUser?.authentication;
                          final credential = GoogleAuthProvider.credential(
                            accessToken: googleAuth?.accessToken,
                            idToken: googleAuth?.idToken,
                          );
                          final user = await FirebaseAuth.instance
                              .signInWithCredential(credential);
                          final userDetails = user.user!;
                          final name =
                              userDetails.displayName.toString().split(" ");
                          context.read<SocialmedialoginBloc>().add(
                              SocialmedialoginEvent.socialSignUp(
                                  userDetails.email.toString(),
                                  name.isNotEmpty ? name[0] : "",
                                  name.isNotEmpty && name.length == 2
                                      ? name[1]
                                      : '',
                                  userDetails.phoneNumber.toString() == "null"
                                      ? ""
                                      : userDetails.phoneNumber.toString(),
                                  userDetails.refreshToken.toString(),
                                  "GOOGLE",
                                  userDetails.photoURL!.toString(),
                                  categories));
                        } catch (error) {
                          print(error);
                        }

                        // Create a new credential
                        // final credential = GoogleAuthProvider.credential(
                        //   accessToken: googleAuth?.accessToken,
                        //   idToken: googleAuth?.idToken,
                        // );
                        //context.router.navigate(HomePageRoute());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                            width: 1.0,
                            color: Colors.grey,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          bottom: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                                "https://img.icons8.com/color/48/000000/google-logo.png",
                                width: 30,
                                height: 30),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Sign up with Google',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: mediaWidth,
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final LoginResult loginResult =
                              await FacebookAuth.instance.login();

                          // Create a credential from the access token
                          final OAuthCredential facebookAuthCredential =
                              FacebookAuthProvider.credential(
                                  loginResult.accessToken!.token);

                          // Once signed in, return the UserCredential
                          final user = await FirebaseAuth.instance
                              .signInWithCredential(facebookAuthCredential);
                          final userDetails = user.user!;
                          final name =
                              userDetails.displayName.toString().split(" ");
                          context.read<SocialmedialoginBloc>().add(
                              SocialmedialoginEvent.socialSignUp(
                                  userDetails.email.toString(),
                                  name.isNotEmpty ? name[0] : "",
                                  name.isNotEmpty && name.length == 2
                                      ? name[1]
                                      : '',
                                  userDetails.phoneNumber.toString() == "null"
                                      ? ""
                                      : userDetails.phoneNumber.toString(),
                                  userDetails.refreshToken.toString(),
                                  "FACEBOOK",
                                  userDetails.photoURL!.toString(),
                                  categories));
                          //context.router.navigate(HomePageRoute());
                        } catch (error) {
                          print(error);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                            width: 1.0,
                            color: Colors.grey,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          bottom: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                                "https://img.icons8.com/fluency/48/000000/facebook-new.png",
                                width: 30,
                                height: 30),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Sign up with Facebook',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(children: <Widget>[
              Expanded(
                child: Divider(
                  color: Colors.grey.shade600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text("or"),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey.shade600,
                ),
              ),
            ]),
            const SizedBox(height: 20),
            SizedBox(
              height: mediaWidth > 750
                  ? MediaQuery.of(context).size.height * 0.35
                  : MediaQuery.of(context).size.height * 0.83,
              child: BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  String cureentSelected = "";
                  context
                      .read<SignUpBloc>()
                      .add(SignUpEvent.changeCategories(categories));
                  return SingleChildScrollView(
                    child: Form(
                      autovalidateMode: state.showErrorMessages
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "E-mail*",
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
                                  onChanged: (value) => context
                                      .read<SignUpBloc>()
                                      .add(SignUpEvent.changeEmail(value)),
                                  validator: (value) => context
                                      .read<SignUpBloc>()
                                      .state
                                      .email
                                      .value
                                      .fold(
                                        (f) => f.maybeMap(
                                          invalidUserName: (_) =>
                                              'Invalid email',
                                          shortLength: (_) =>
                                              'Email should be greater than 3 characters',
                                          orElse: () => null,
                                        ),
                                        (_) => null,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Wrap(
                            children: [
                              Checkbox(
                                onChanged: (val) => context
                                    .read<SignUpBloc>()
                                    .add(const SignUpEvent.termAndCondition()),
                                value: state.termAndCondition,
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      maximumSize: Size.fromWidth(
                                          MediaQuery.of(context).size.width >
                                                  750
                                              ? mediaWidth * 0.55
                                              : mediaWidth * 0.65)),
                                  onPressed: () => context
                                      .read<SignUpBloc>()
                                      .add(
                                          const SignUpEvent.termAndCondition()),
                                  child: RichText(
                                    text: const TextSpan(children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            "By creating account you agree to the",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " terms of use ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF015397),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "and our ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'privacy policy',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF015397),
                                        ),
                                      )
                                    ]),
                                    textAlign: TextAlign.start,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                onPressed: () => {
                                      context
                                          .read<SignUpBloc>()
                                          .add(const SignUpEvent.signUp())
                                    },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF015397),
                                  minimumSize: const Size.fromHeight(
                                    40,
                                  ),
                                ),
                                child: const Text("Sign up",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          ),
                          const SizedBox(
                            height: 37,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    context.router.navigate(HomePageRoute());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[300],
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
