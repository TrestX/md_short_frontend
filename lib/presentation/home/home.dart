import 'package:MD_Shorts/apis/pixel_api.dart';
import 'package:MD_Shorts/main.dart';
import 'package:MD_Shorts/presentation/home/mobile/news_mobile.dart';
import 'package:MD_Shorts/presentation/home/web/news_web.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatelessWidget {
  final String newID;
  const HomePage({Key? key, @PathParam('id') this.newID = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    PixelApiClient().syncPixel();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
    return kIsWeb
        ? Scaffold(
            body: NewsWeb(
              newID: newID,
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: NewsMobile(
              newID: newID,
            ),
          );
  }

  double widthGetMethod(BuildContext context) {
    return MediaQuery.of(context).size.width > 768
        ? 768
        : MediaQuery.of(context).size.width;
  }
}
