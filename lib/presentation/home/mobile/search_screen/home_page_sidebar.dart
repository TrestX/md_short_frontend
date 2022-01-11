import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageSideBar extends StatelessWidget {
  const HomePageSideBar({
    Key? key,
  }) : super(key: key);
  Future<List> getUserData() async {
    var firstName = await ProfileNotifier().getFirstName();
    var lastName = await ProfileNotifier().getLastName();
    var designation = await ProfileNotifier().getDesignation();
    var profileper = await ProfileNotifier().getProfilePer();
    var email = await ProfileNotifier().getEmail();
    var photo = await ProfileNotifier().getAvatarUrl();
    return Future.value(
        [firstName, lastName, email, photo,designation,profileper]); // return your response
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getUserData(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<List> userdata) {
        // AsyncSnapshot<Your object type>
        if (userdata.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('loading...'));
        } else {
          if (userdata.hasError) {
            return Center(child: Text('Error: ${userdata.error}'));
          } else {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
              ),
              child: Drawer(
                elevation: 16.0,
                child: userdata.data != null && userdata.data![2] != ""
                    ? Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: <Widget>[

                                      CircleAvatar(
                                      radius: 45,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                          "${userdata.data != null && userdata.data![3] != null && userdata.data![3] != "" ? userdata.data![3] : "https://headshots-inc.com/wp-content/uploads/2020/12/Blog-Images.jpg"}"),
                                    ),
                                    SizedBox(width: 90, height:90, child: CircularProgressIndicator(
                                      backgroundColor: Colors.grey.shade300,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF015397),
                                      ),
                                      value:userdata.data != null && userdata.data![5] != "" ? double.parse(userdata.data![5])/100 : 0,
                                      
                                      ),)
                                                                          
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                  
                                    '${userdata.data != null && userdata.data![0] != "" ? userdata.data![0] : ""}'
                                    ' ${userdata.data != null && userdata.data![0] != "" ? userdata.data![1] : ""}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF606060),
                                    ),
                                  ),
                                  Text(
                                    '${userdata.data != null ?userdata.data![4] !=""?userdata.data![4]: userdata.data![2] !=""? userdata.data![2]:" ":" "}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFF0848484),
                                    ),
                                  ),
                                                                
                                  const SizedBox(height: 20),
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25.0)),
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey.shade300,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF015397),
                                      ),
                                      value: userdata.data != null && userdata.data![5] != "" ? double.parse(userdata.data![5])/100 : 0,
                                      minHeight: 9,
                                    ),
                                  ),
                                  const SizedBox(height: 7),

                                                                    Text(
                                    '${userdata.data != null && userdata.data![5] != "" ? userdata.data![5] : 0}% completed profile',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFF0848484),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            ListTile(
                              title: const Text("Profile"),
                              onTap: () {
                                context.router
                                    .navigate(const ProfilePageRoute());
                              },
                              leading:
                                  const Icon(FontAwesomeIcons.user, size: 27),
                            ),
                            ListTile(
                              title: const Text("Interests"),
                              onTap: () {
                                context.router
                                    .navigate(const InterestPageRoute());
                              },
                              leading:
                                  const Icon(FontAwesomeIcons.heart, size: 27),
                            ),
                            ListTile(
                              title: const Text("Notification"),
                              onTap: () {
                                context.router
                                    .navigate(const NotificationScreenRoute());
                              },
                              leading:
                                  const Icon(FontAwesomeIcons.bell, size: 27),
                            ),
                            ListTile(
                              title: const Text("Settings"),
                              onTap: () {
                                context.router
                                    .navigate(const SettingScreenRoute());
                              },
                              leading:
                                  const Icon(FontAwesomeIcons.cog, size: 27),
                            ),
                            ListTile(
                              title: const Text("Privacy Policy"),
                              onTap: () {
                                context.router.navigate(PrivacyPolicyRoute());
                                // Update the state of the app.
                                // ...
                              },
                              leading: const Icon(Icons.lock, size: 27),
                            ),
                            ListTile(
                                title: const Text("Help"),
                                leading:
                                    const Icon(Icons.help_outline, size: 27),
                                onTap: () async {
                                  final mailtoLink = Mailto(
                                    to: ['update@mdshorts.com'],
                                    subject: 'Help',
                                    body: '',
                                  );
                                  await launch('$mailtoLink');
                                }),
                            ListTile(
                              title: const Text("Logout"),
                              onTap: () {
                                ProfileNotifier().setProfile(
                                    "", "", "", "", "", "", "","", [], "");
                                context.router.navigate(LoginPageRoute());
                              },
                              leading: const Icon(Icons.logout, size: 27),
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: TextButton(
                            onPressed: () {
                              context.router.navigate(LoginPageRoute());
                            },
                            child: const Text("Click Here to login")),
                      ),
              ),
            );
          }
        }
      },
    );
  }
}
