import 'package:MD_Shorts/application/news/news_form/news_form_bloc.dart';
import 'package:MD_Shorts/application/news/news_watcher/news_watcher_dart_bloc.dart';
import 'package:MD_Shorts/injection.dart';
import 'package:MD_Shorts/presentation/home/web/widgets/news_web_list.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWeb extends StatelessWidget {
  const NewsWeb({Key? key, this.newID = ""}) : super(key: key);
  final String newID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<NewsWatcherDartBloc>(
            create: (context) => getIt<NewsWatcherDartBloc>()
              ..add(
                NewsWatcherDartEvent.watchAllStarted(newID),
              ),
          ),
          BlocProvider<NewsFormBloc>(
            create: (context) => getIt<NewsFormBloc>()
              ..add(
                const NewsFormEvent.initialized(),
              ),
          ),
        ],
        child: BlocBuilder<NewsWatcherDartBloc, NewsWatcherDartState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ],
              ),
              loadInProgress: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ],
              ),
              loadSuccess: (productValue) => Scaffold(
                appBar: WebAppBar(),
                drawer: const WebSideBar(),
                body: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: NewsWebList(
                        news: productValue.news,
                        widthNew: widthGetMethod(context),
                      ),
                    ),
                    Container(
                        color: Colors.black87,
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Center(
                            child: SizedBox(
                          width: MediaQuery.of(context).size.width > 700
                              ? MediaQuery.of(context).size.width * 0.5
                              : MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      height: 55,
                                      child: Image.asset(
                                          'assets/images/md_shorts.png')),
                                  const VerticalDivider(color: Colors.white),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Contact us",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.email_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsets>(
                                              const EdgeInsets.all(0)),
                                        ),
                                        onPressed: () {
                                          context.router
                                              .navigate(PrivacyPolicyRoute());
                                        },
                                        child: const Text(
                                          "Privacy Policy",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () => _launchURL(
                                              "https://www.facebook.com/Mdshortsapp"),
                                          icon: const FaIcon(
                                            FontAwesomeIcons.facebookF,
                                            color: Colors.white,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const FaIcon(
                                            FontAwesomeIcons.twitterSquare,
                                            color: Colors.white,
                                          )),
                                      IconButton(
                                          onPressed: () => _launchURL(
                                              "https://www.linkedin.com/company/mdshorts/"),
                                          icon: const FaIcon(
                                            FontAwesomeIcons.linkedinIn,
                                            color: Colors.white,
                                          )),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )))
                  ],
                ),
              ),
              loadFailure: (_) => Container(),
            );
          },
        ),
      ),
    );
  }

  double widthGetMethod(BuildContext context) {
    return MediaQuery.of(context).size.width > 1012
        ? 1012
        : MediaQuery.of(context).size.width;
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  WebAppBar({
    Key? key,
  }) : super(key: key);
  Future<String> getUserData() async {
    return await ProfileNotifier.instance.getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getUserData(), // function where you call your api
        builder: (BuildContext context, AsyncSnapshot<String> userdata) {
          if (userdata.connectionState == ConnectionState.waiting ||
              userdata.hasError) {
            return AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 90,
              title: Center(
                  child: Image.asset(
                'assets/images/md_shorts.png',
                width: 150,
              )),
              centerTitle: true,
              leadingWidth: 100,
              iconTheme: const IconThemeData(
                color: Color(0xFF015397),
              ),
            );
          } else if (userdata.data == "" || userdata.data == null) {
            return AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 90,
              title: Center(
                  child: Image.asset(
                'assets/images/md_shorts.png',
                width: 150,
              )),
              centerTitle: true,
              leadingWidth: 100,
              iconTheme: const IconThemeData(
                color: Color(0xFF015397),
              ),
              actions: [
                TextButton.icon(
                  onPressed: () =>
                      context.router.push(const CategoryPageRoute()),
                  icon: const Text("SignUp"),
                  label: const FaIcon(FontAwesomeIcons.userCircle),
                ),
                const SizedBox(width: 100),
              ],
            );
          } else {
            return AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 90,
              title: Center(
                  child: Image.asset(
                'assets/images/md_shorts.png',
                width: 150,
              )),
              centerTitle: true,
              leadingWidth: 100,
              iconTheme: const IconThemeData(
                color: Color(0xFF015397),
              ),
            );
          }
        });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(90.0);
}

class WebSideBar extends StatelessWidget {
  const WebSideBar({
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
            return Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors
                    .black87, //This will change the drawer background to blue.
                //other styles
              ),
              child: Drawer(
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: userdata.data != null && userdata.data![2] != ""
                    ? ListView(
                        // Important: Remove any padding from the ListView.
                        padding: EdgeInsets.zero,
                        children: [
                          DrawerHeader(
                              decoration: const BoxDecoration(
                                color: Color(0x00000000),
                              ),
                              child: Wrap(children: [
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
                               
                              ])),
                          Padding(
                            padding: const EdgeInsets.only(top: 45.0),
                            child: Wrap(
                              children: [
                                ListTile(
                                  title: const Text(
                                    'Profile',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    context.router
                                        .popAndPush(const ProfilePageRoute());
                                  },
                                  leading: const Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  title: const Text(
                                    'Interests',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    context.router
                                        .navigate(const InterestPageRoute());
                                  },
                                  leading: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  title: const Text(
                                    'Notifications',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    context.router.navigate(
                                        const NotificationScreenRoute());
                                  },
                                  leading: const Icon(
                                    Icons.notifications_none,
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  title: const Text(
                                    'Settings',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    context.router
                                        .navigate(const SettingScreenRoute());
                                  },
                                  leading: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  title: const Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    context.router
                                        .navigate(PrivacyPolicyRoute());
                                    // Update the state of the app.
                                    // ...
                                  },
                                  leading: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  title: const Text(
                                    'Help',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    // Update the state of the app.
                                    // ...
                                  },
                                  leading: const Icon(
                                    Icons.help_outline,
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  title: const Text(
                                    'Logout',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    ProfileNotifier().setProfile(
                                        "", "", "", "", "", "", "","", [], "");
                                    context.router.popAndPush(LoginPageRoute());
                                    Navigator.pop(context);
                                  },
                                  leading: const Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: TextButton(
                            onPressed: () {
                              context.router.navigate(LoginPageRoute());
                              Navigator.pop(context);
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
