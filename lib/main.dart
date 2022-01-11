import 'dart:io';

import 'package:MD_Shorts/apis/pixel_api.dart';
import 'package:MD_Shorts/presentation/main_widget/main_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:url_strategy/url_strategy.dart';
import 'injection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() {
  if (!kIsWeb && Platform.isIOS) {
    mainIos();
  } else {
    mainAndroid();
  }
}

Future<void> _messageHandler(RemoteMessage message) async {}
Future<void> mainIos() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title// description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  FirebaseMessaging.instance.subscribeToTopic("General");

  configureInjection(Environment.prod);
  setPathUrlStrategy();
  runApp(MainWidget());
}

Future<void> mainAndroid() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
// you can also assign this app to a FirebaseApp variable
// for example app = await FirebaseApp.initializeApp...

    await Firebase.initializeApp(
      name: 'mdshorts',
      options: const FirebaseOptions(
          apiKey: "AIzaSyCaCFv47WQ5bhzBE6Dx4PmseYtFoo8UCqU",
          authDomain: "md-shorts.firebaseapp.com",
          projectId: "md-shorts",
          storageBucket: "md-shorts.appspot.com",
          messagingSenderId: "397171372527",
          appId: "1:397171372527:web:c10e357495b5b53b15861a",
          measurementId: "G-3TQ8H3BZ7Q"),
    );
  } on FirebaseException catch (e) {
    if (e.code == 'duplicate-app') {
// you can choose not to do anything here or either
// In a case where you are assigning the initializer instance to a FirebaseApp variable, // do something like this:
//
//   app = Firebase.app('SecondaryApp');
//
    } else {
      throw e;
    }
  } catch (e) {
    rethrow;
  }
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title// description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.subscribeToTopic("General");
  }
  await PixelApiClient().getPlatformId();
  await PixelApiClient().syncPixel();
  configureInjection(Environment.prod);
  setPathUrlStrategy();
  runApp(MainWidget());
}
