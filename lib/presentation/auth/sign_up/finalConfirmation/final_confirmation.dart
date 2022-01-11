import 'package:flutter/material.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

class FinalConfirmation extends StatefulWidget {
  const FinalConfirmation({Key? key}) : super(key: key);
  @override
  _FCState createState() => _FCState();
}

class _FCState extends State<FinalConfirmation> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  @override
  void initState() {
    super.initState();
    ProfileNotifier.instance.getEmail().then((value) => setState(() {
          email = value;
        }));
  }

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
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: Content(
                    mediaWidth: mediaWidth,
                    email: email,
                  ),
                )
              : Content(
                  mediaWidth: mediaWidth,
                  email: email,
                ),
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
  const Content({Key? key, required this.mediaWidth, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: mediaWidth > 750
                ? const EdgeInsets.all(200)
                : const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Check Your Inbox!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF015397)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "We sent an email to " +
                      email +
                      ". Click on the verification link inside and we will take it from there.",
                  textAlign: TextAlign.center,
                ),
                const Text(""),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        context.router.popAndPush(HomePageRoute());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF015397),
                        minimumSize: Size(
                            MediaQuery.of(context).size.width > 500
                                ? mediaWidth * 0.5
                                : mediaWidth,
                            40),
                      ),
                      child: const Text("Close",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
