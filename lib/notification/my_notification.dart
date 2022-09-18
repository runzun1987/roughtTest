import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/order_details_screen.dart';
import 'package:flutter_sixvalley_ecommerce/main.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../provider/order_provider.dart';
import '../provider/profile_provider.dart';

class MyNotification {
  static Future<void> get_order_navigate(
    String orderId,
    BuildContext context,
  ) async {
    bool isGuestMode = !await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context);

    if (!isGuestMode) {
      String? phone = Provider.of<ProfileProvider>(context, listen: false)
          .userInfoModel!
          .phone;

      await Provider.of<OrderProvider>(context, listen: false)
          .getOrderDetails(phone!, orderId, context);
      var result = Provider.of<OrderProvider>(context,listen: false).searchResultList;

      if (result != null && result.length != 0) {
        MyApp.navigatorKey.currentState!.push(
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(
              orderModel: result[0],
              orderId: orderId,
              // orderType: 'default_type',
            ),
          ),
        );
      }
    }
  }

  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      BuildContext context) async {
    var androidInitialize =
        new AndroidInitializationSettings('notification_icon');
    var iOSInitialize = new IOSInitializationSettings();
    print(
        '---------------------------------TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT--------------------------------');
    var initializationsSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings,
        onSelectNotification: (String? payload) async {
      try {
        if (payload != null && payload.isNotEmpty) {
          get_order_navigate(payload, context);
          // MyApp.navigatorKey.currentState!.push(
          //   MaterialPageRoute(
          //     builder: (context) => OrderDetailsScreen(
          //       orderModel: null,
          //       orderId: int.parse(payload),
          //       orderType: 'default_type',
          //     ),
          //   ),
          // );
        }
      } catch (e) {
        print(e);
      }
      return;
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      try {
        if (message?.data['order_id'] != null &&
            message?.data['order_id']!.isNotEmpty) {
          get_order_navigate(message!.data['order_id'], context);
          // MyApp.navigatorKey.currentState!.push(
          //   MaterialPageRoute(
          //     builder: (context) => OrderDetailsScreen(
          //       orderModel: null,
          //       orderId: int.parse(message!.data['order_id']),
          //       orderType: 'default_type',
          //     ),
          //   ),
          // );
        }
      } catch (e) {
        print(e);
      }
    });
    void _check() {}

    _check();

    FirebaseMessaging.instance.subscribeToTopic(AppConstants.TOPIC);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          "onMessage: ${message.notification!.title}/${message.notification!.body}/${message.data['orderId']}");
      showNotification(message, flutterLocalNotificationsPlugin, true);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          "onOpenApp: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");

      try {
        if (message.data['order_id'] != null &&
            message.data['order_id']!.isNotEmpty) {
          get_order_navigate(message!.data['order_id'], context);
          // MyApp.navigatorKey.currentState!.push(
          //   MaterialPageRoute(
          //     builder: (context) => OrderDetailsScreen(
          //       orderModel: null,
          //       orderId: int.parse(message.data['order_id']!),
          //       orderType: 'default_type',
          //     ),
          //   ),
          // );
        }
      } catch (e) {
        print(e);
      }
    });
  }

  static Future<void> showNotification(RemoteMessage message,
      FlutterLocalNotificationsPlugin fln, bool data) async {
    String? _title;
    String? _body;
    String? _orderID;
    String? _image;
    if (data) {
      _title = message.data['title'];
      _body = message.data['body'];
      _orderID = message.data['order_id'];

      _image = (message.data['image'] != null &&
              message.data['image'].isNotEmpty)
          ? message.data['image'].startsWith('http')
              ? message.data['image']
              : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.data['image']}'
          : null;
    } else {
      _title = message.notification!.title;
      _body = message.notification!.body;
      _orderID = message.notification!.titleLocKey;
      if (Platform.isAndroid) {
        _image = (message.notification!.android!.imageUrl != null &&
                message.notification!.android!.imageUrl!.isNotEmpty)
            ? message.notification!.android!.imageUrl!.startsWith('http')
                ? message.notification!.android!.imageUrl
                : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.notification!.android!.imageUrl}'
            : null;
      } else if (Platform.isIOS) {
        _image = (message.notification!.apple!.imageUrl != null &&
                message.notification!.apple!.imageUrl!.isNotEmpty)
            ? message.notification!.apple!.imageUrl!.startsWith('http')
                ? message.notification!.apple!.imageUrl
                : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.notification!.apple!.imageUrl}'
            : null;
      }
    }

    if (_image != null && _image.isNotEmpty) {
      try {
        await showBigPictureNotificationHiddenLargeIcon(
            _title, _body, _orderID, _image, fln);
      } catch (e) {
        await showBigTextNotification(_title, _body!, _orderID, fln);
      }
    } else {
      await showBigTextNotification(_title, _body!, _orderID, fln);
    }
  }

  static Future<void> showTextNotification(String title, String body,
      String orderID, FlutterLocalNotificationsPlugin fln) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'pushnotificationapp',
      'pushnotificationappChannel',
      playSound: true,
      importance: Importance.max,
      priority: Priority.max,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<void> showBigTextNotification(String? title, String body,
      String? orderID, FlutterLocalNotificationsPlugin fln) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      body,
      htmlFormatBigText: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'pushnotificationapp',
      'pushnotificationappChannel',
      importance: Importance.max,
      styleInformation: bigTextStyleInformation,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<void> showBigPictureNotificationHiddenLargeIcon(
      String? title,
      String? body,
      String? orderID,
      String image,
      FlutterLocalNotificationsPlugin fln) async {
    final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
    final String bigPicturePath =
        await _downloadAndSaveFile(image, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      hideExpandedLargeIcon: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
      summaryText: body,
      htmlFormatSummaryText: true,
    );
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'pushnotificationapp',
      'pushnotificationappChannel',
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      priority: Priority.max,
      playSound: true,
      styleInformation: bigPictureStyleInformation,
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<String> _downloadAndSaveFile(
      String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final Response response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    final File file = File(filePath);
    await file.writeAsBytes(response.data);
    return filePath;
  }
}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  print(
      "onBackground: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
}
