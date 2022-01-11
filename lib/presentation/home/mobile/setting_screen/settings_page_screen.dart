import 'package:MD_Shorts/apis/profile_api.dart';
import 'package:MD_Shorts/application/settings/changepassword/changepassword_bloc.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

final TextEditingController _pass = TextEditingController();

class SettingsScreenPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  SettingsScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 150,
                  child: ListView(
                    children: [
                      // GFAccordion(
                      //     contentBackgroundColor: const Color(0x00000000),
                      //     collapsedTitleBackgroundColor:
                      //         const Color(0x00000000),
                      //     expandedTitleBackgroundColor: const Color(0x00000000),
                      //     textStyle: TextStyle(
                      //         fontSize: 21,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.grey[800]),
                      //     title: 'Change password',
                      //     contentChild: Padding(
                      //       padding:
                      //           const EdgeInsets.only(top: 16.0, left: 16.0),
                      //       child: BlocBuilder<ChangepasswordBloc,
                      //           ChangepasswordState>(
                      //         builder: (context, state) {
                      //           return Form(
                      //             autovalidateMode: AutovalidateMode.always,
                      //             child: Column(
                      //               children: <Widget>[
                      //                 Row(
                      //                   children: const [
                      //                     Padding(
                      //                       padding: EdgeInsets.only(
                      //                           top: 10, bottom: 10),
                      //                       child: Text(
                      //                         "New Password*",
                      //                         style: TextStyle(fontSize: 18),
                      //                         textAlign: TextAlign.start,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 Row(
                      //                   children: [
                      //                     SizedBox(
                      //                       width: MediaQuery.of(context)
                      //                                   .size
                      //                                   .width >
                      //                               768
                      //                           ? 500
                      //                           : 300,
                      //                       child: TextFormField(
                      //                         controller: _pass,
                      //                         decoration: const InputDecoration(
                      //                           border: OutlineInputBorder(),
                      //                           isDense: true, // Added this
                      //                           contentPadding:
                      //                               EdgeInsets.all(8),
                      //                         ),
                      //                         obscureText: true,
                      //                         onChanged: (value) => context
                      //                             .read<ChangepasswordBloc>()
                      //                             .add(ChangepasswordEvent
                      //                                 .changePpassword(value)),
                      //                         validator: (value) => context
                      //                             .read<ChangepasswordBloc>()
                      //                             .state
                      //                             .password
                      //                             .value
                      //                             .fold(
                      //                               (f) => f.maybeMap(
                      //                                 shortLength: (_) =>
                      //                                     'Password should be greater than 8 characters',
                      //                                 dontContainDigit: (_) =>
                      //                                     'Password should be contain a digit',
                      //                                 dontContainLower: (_) =>
                      //                                     'Password should be contain a lower case character',
                      //                                 dontContainUpper: (_) =>
                      //                                     'Password should be contain a upper case character',
                      //                                 empty: (_) =>
                      //                                     'Password should be greater than 8 characters.It should contain a lower case character. aupper case character and a digit',
                      //                                 orElse: () => null,
                      //                               ),
                      //                               (_) => null,
                      //                             ),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 Row(children: const [
                      //                   Padding(
                      //                     padding: EdgeInsets.only(
                      //                         top: 10, bottom: 10),
                      //                     child: Text(
                      //                       "Confirm Password*",
                      //                       style: TextStyle(fontSize: 18),
                      //                       textAlign: TextAlign.start,
                      //                     ),
                      //                   ),
                      //                 ]),
                      //                 Row(
                      //                   children: [
                      //                     SizedBox(
                      //                       width: MediaQuery.of(context)
                      //                                   .size
                      //                                   .width >
                      //                               768
                      //                           ? 500
                      //                           : 300,
                      //                       child: TextFormField(
                      //                         decoration: const InputDecoration(
                      //                           border: OutlineInputBorder(),
                      //                           isDense: true, // Added this
                      //                           contentPadding:
                      //                               EdgeInsets.all(8),
                      //                         ),
                      //                         obscureText: true,
                      //                         onChanged: (value) {
                      //                           context
                      //                               .read<ChangepasswordBloc>()
                      //                               .add(ChangepasswordEvent
                      //                                   .passwordVerified(state
                      //                                           .password
                      //                                           .isValid() &&
                      //                                       state.password
                      //                                               .getOrCrash() !=
                      //                                           value));
                      //                         },
                      //                         validator: (value) {
                      //                           context
                      //                               .read<ChangepasswordBloc>()
                      //                               .add(ChangepasswordEvent
                      //                                   .passwordVerified(state
                      //                                           .password
                      //                                           .isValid() &&
                      //                                       state.password
                      //                                               .getOrCrash() ==
                      //                                           value));
                      //                           if (!state.password.isValid() ||
                      //                               state.password
                      //                                       .getOrCrash() !=
                      //                                   value) {
                      //                             return "Password doesn't match";
                      //                           } else {
                      //                             return null;
                      //                           }
                      //                         },
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.end,
                      //                     children: [
                      //                       Padding(
                      //                         padding: const EdgeInsets.only(
                      //                           top: 13,
                      //                           right: 23,
                      //                         ),
                      //                         child: ElevatedButton(
                      //                             onPressed: () {
                      //                               context
                      //                                   .read<
                      //                                       ChangepasswordBloc>()
                      //                                   .add(ChangepasswordEvent
                      //                                       .changePassword(
                      //                                           state
                      //                                               .password));
                      //                             },
                      //                             style:
                      //                                 ElevatedButton.styleFrom(
                      //                               primary:
                      //                                   const Color(0xFF015397),
                      //                             ),
                      //                             child: const Text("Submit",
                      //                                 style: TextStyle(
                      //                                     fontSize: 18,
                      //                                     fontWeight: FontWeight
                      //                                         .bold))),
                      //                       ),
                      //                     ])
                      //               ],
                      //             ),
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //     collapsedIcon: const Text(''),
                      //     expandedIcon: const Text('')),
                      // const Divider(
                      //   color: Colors.black,
                      //   height: 20,
                      // ),
                      // GFAccordion(
                      //     contentBackgroundColor: const Color(0x00000000),
                      //     collapsedTitleBackgroundColor:
                      //         const Color(0x00000000),
                      //     expandedTitleBackgroundColor: const Color(0x00000000),
                      //     textStyle: TextStyle(
                      //         fontSize: 21,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.grey[800]),
                      //     title: 'Social Accounts Integration',
                      //     content: '',
                      //     collapsedIcon: const Text(''),
                      //     expandedIcon: const Text('')),
                      // const Divider(
                      //   color: Colors.black,
                      //   height: 20,
                      // ),
                      // GFAccordion(
                      //     contentBackgroundColor: const Color(0x00000000),
                      //     collapsedTitleBackgroundColor:
                      //         const Color(0x00000000),
                      //     expandedTitleBackgroundColor: const Color(0x00000000),
                      //     textStyle: TextStyle(
                      //         fontSize: 21,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.grey[800]),
                      //     title: 'Email Notifications',
                      //     content: '',
                      //     collapsedIcon: const Text(''),
                      //     expandedIcon: const Text('')),
                      // const Divider(
                      //   color: Colors.black,
                      //   height: 20,
                      // ),
                      SizedBox(
                        width: 10,
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.only(right: 100.0),
                            ),
                          ),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Close Account"),
                              content: const Text(
                                  "Are you sure you want to close your account?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("No"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await ProfileApiClient().closeProfile();
                                    context.router.popAndPush(LoginPageRoute());
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            ),
                          ),
                          child: Text(
                            'Close your Account',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
