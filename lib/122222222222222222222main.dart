// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'notification/my_notification.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp();

//   // await di.init();
//   final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//       await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

//   await MyNotification.initialize(flutterLocalNotificationsPlugin);
//   FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static final navigatorKey = new GlobalKey<NavigatorState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: Text('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'));
//   }
// }
