import 'dart:io';

import 'package:MD_Shorts/application/auth/sign_in/sign_in_bloc.dart';
import 'package:MD_Shorts/application/auth/socialMediaLogin/bloc/socialmedialogin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    Key? key,
    required this.mediaWidth,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final double mediaWidth;
  final GlobalKey<FormState> _formKey;

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
        return BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    message: failure.map(
                      cancelledByUser: (_) => 'Cancelled',
                      serverError: (_) => 'Server error',
                      emailAlreadyRegistered: (_) => 'Invalid credentials',
                      emailNotRegistered: (_) => 'Invalid credentials',
                      emailNotVerified: (_) => 'Email not verified',
                      invalidCredentails: (_) => 'Invalid credentials',
                    ),
                  ).show(context);
                },
                (_) {
                  context.router.navigate(PhoneVerificationScreenRoute(
                      email: state.email.getOrCrash()));
                  // context.router.navigate(HomePageRoute());
                },
              ),
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
                                        0.13,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.13),
                                child: LoginCardContent(
                                    formKey: _formKey, mediaWidth: mediaWidth),
                              )
                            : LoginCardContent(
                                formKey: _formKey, mediaWidth: mediaWidth),
                      ),
                    ),
                  ]),
            );
          },
        );
      },
    );
  }
}

class LoginCardContent extends StatelessWidget {
  const LoginCardContent({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.mediaWidth,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double mediaWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: mediaWidth > 750
          ? const EdgeInsets.only(left: 150, right: 150, top: 70, bottom: 20)
          : const EdgeInsets.fromLTRB(70, 20, 70, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaWidth > 750
                  ? MediaQuery.of(context).size.height * 0.05
                  : MediaQuery.of(context).size.height * 0.12,
              child: Center(
                  child: Image.asset(
                'assets/images/md_shorts.png',
                width: 200,
              )),
            ),
            const SizedBox(height: 30),
            const Text(
              "Sign in",
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
                  context.router.navigate(const CategoryPageRoute());
                },
                child: RichText(
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'Not registered? ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF015397),
                      ),
                    )
                  ]),
                  textAlign: TextAlign.start,
                )),
            SizedBox(
              height: mediaWidth > 750
                  ? MediaQuery.of(context).size.height * 0.33
                  : MediaQuery.of(context).size.height * 0.57,
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return Form(
                    autovalidateMode: state.showErrorMessages != null
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.zero,
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
                                  final credential =
                                      GoogleAuthProvider.credential(
                                    accessToken: googleAuth?.accessToken,
                                    idToken: googleAuth?.idToken,
                                  );
                                  final user = await FirebaseAuth.instance
                                      .signInWithCredential(credential);
                                  final userDetails = user.user!;
                                  final name = userDetails.displayName
                                      .toString()
                                      .split(" ");
                                  context.read<SocialmedialoginBloc>().add(
                                      SocialmedialoginEvent.socialSignUp(
                                          userDetails.email.toString(),
                                          name.isNotEmpty ? name[0] : "",
                                          name.isNotEmpty && name.length == 2
                                              ? name[1]
                                              : '',
                                          userDetails.phoneNumber.toString() ==
                                                  "null"
                                              ? ""
                                              : userDetails.phoneNumber
                                                  .toString(),
                                          userDetails.refreshToken.toString(),
                                          "GOOGLE",
                                          userDetails.photoURL!.toString(),
                                          []));
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

                                        Platform.isIOS? 
                                          SizedBox(
                          width: mediaWidth,
                          child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  final credential = await SignInWithApple
                                      .getAppleIDCredential(
                                    scopes: [
                                      AppleIDAuthorizationScopes.email,
                                      AppleIDAuthorizationScopes.fullName,
                                    ],
                                  );
                                  context.read<SocialmedialoginBloc>().add(
                                      SocialmedialoginEvent.socialSignUp(
                                          credential.email.toString(),
                                          credential.givenName.toString(),
                                          credential.familyName.toString(),
                                          "",
                                          credential.authorizationCode
                                              .toString(),
                                          "APPLE",
                                          "",
                                          [""]));
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
                                        "https://img.icons8.com/material-outlined/50/000000/mac-os--v2.png",
                                        width: 30,
                                        height: 30),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      'Sign up with Apple',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )),
                        ):const SizedBox(height: 0),
                 Platform.isIOS?const SizedBox(height: 10):const SizedBox(height: 10),
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
                                      .signInWithCredential(
                                          facebookAuthCredential);
                                  final userDetails = user.user!;
                                  final name = userDetails.displayName
                                      .toString()
                                      .split(" ");
                                  context.read<SocialmedialoginBloc>().add(
                                      SocialmedialoginEvent.socialSignUp(
                                          userDetails.email.toString(),
                                          name.isNotEmpty ? name[0] : "",
                                          name.isNotEmpty && name.length == 2
                                              ? name[1]
                                              : '',
                                          userDetails.phoneNumber.toString() ==
                                                  "null"
                                              ? ""
                                              : userDetails.phoneNumber
                                                  .toString(),
                                          userDetails.refreshToken.toString(),
                                          "FACEBOOK",
                                          userDetails.photoURL!.toString(),
                                          []));
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
                                  contentPadding: EdgeInsets.all(12),
                                ),
                                onChanged: (value) => context
                                    .read<SignInBloc>()
                                    .add(SignInEvent.changeEmail(value)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                              child: Checkbox(
                                onChanged: (value) => context
                                    .read<SignInBloc>()
                                    .add(SignInEvent.rememberMe(value)),
                                value:
                                    context.read<SignInBloc>().state.rememberMe,
                              ),
                            ),
                            RichText(
                              text: const TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Remember me',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF015397),
                                  ),
                                )
                              ]),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                onPressed: () => context.read<SignInBloc>().add(
                                    const SignInEvent
                                        .loginWithUserNamePassword()),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF015397),
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width > 500
                                          ? mediaWidth * 0.5
                                          : mediaWidth,
                                      40),
                                ),
                                child: const Text("Sign in",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     context.router
                        //         .navigate(const ForgotPasswordScreenRoute());
                        //   },
                        //   child: const Text("Forgot Password"),
                        // ),
                        const SizedBox(
                          height: 20,
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
