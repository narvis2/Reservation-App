import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reservation_app/domain/model/fcm/enum/notification_type.dart';
import 'package:reservation_app/domain/model/fcm/fcm_notification_data_model.dart';
import 'package:reservation_app/domain/model/fcm/fcm_notification_model.dart';
import 'package:rxdart/rxdart.dart';

class FcmRepository {
  final FirebaseMessaging _firebaseMessaging;
  final Stream<RemoteMessage> _onForegroundNotification;
  final BehaviorSubject<FcmNotificationDataModel> _onNotificationOpenedController;
  final AndroidNotificationChannel _channel;

  final FlutterLocalNotificationsPlugin _localNotifications;

  FcmRepository({
    AndroidNotificationChannel? channel,
    FlutterLocalNotificationsPlugin? localNotification,
    FirebaseMessaging? firebaseMessaging,
    Stream<RemoteMessage>? onNotificationOpened,
    Stream<RemoteMessage>? onForegroundNotification,
  })  : _channel = AndroidNotificationChannel(
          'woo_hoe_dam_channel',
          'woo_hoe_dam',
          description: 'Reservation for woo hoe dam',
          importance: Importance.max,
          enableVibration: true,
        ),
        _localNotifications =
            localNotification ?? FlutterLocalNotificationsPlugin(),
        _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance,
        _onForegroundNotification =
            onForegroundNotification ?? FirebaseMessaging.onMessage,
        _onNotificationOpenedController =
            BehaviorSubject<FcmNotificationDataModel>() {
    _initialize(onNotificationOpened ?? FirebaseMessaging.onMessageOpenedApp);
  }

  Future<void> _initialize(Stream<RemoteMessage> onNotificationOpened) async {
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    await _localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestCriticalPermission: false,
        ),
      ),
      onDidReceiveNotificationResponse: _onForegroundLocalNotificationClick,
    );

    final permission = await _firebaseMessaging.requestPermission(
      badge: true,
      alert: true,
      sound: true,
    );
    final status = permission.authorizationStatus;

    if (status == AuthorizationStatus.authorized) {
      final message = await _firebaseMessaging.getInitialMessage();
      final token = await _firebaseMessaging.getToken();

      if (token != null) {
        debugPrint("🔔 Firebase Cloud Message Token 👉 $token");
        await _sendFcmToken(token);
      }

      // 📌 Terminate 환경
      if (message != null) {
        _onMessageOpened(message, NotificationType.terminated);
      }

      // 📌 Background 환경
      onNotificationOpened.listen((event) {
        _onMessageOpened(event, NotificationType.background);
      });

      _firebaseMessaging.onTokenRefresh.listen((token) {
        debugPrint("🔔 Firebase Cloud Message Refresh Token 👉 $token");
        _sendFcmToken(token);
      });
    }
  }

  Future<void> _sendFcmToken(String fcmToken) {
    // TODO:: Fcm Token 저장 API Call
    return Future.sync(() => null);
  }

  /// Terminate, Background 에서 Push 알림을 Click 했을때 호출됨
  void _onMessageOpened(
    RemoteMessage message,
    NotificationType notificationType,
  ) {
    final RemoteNotification? notification = message.notification;
    if (notification != null) {
      _onNotificationOpenedController.sink.add(
        FcmNotificationDataModel(
          notificationType: notificationType,
          data: message.data,
        ),
      );
    }
  }

  /// Foreground 에서 Local Push 알림을 Click 했을때 호출됨
  void _onForegroundLocalNotificationClick(
    NotificationResponse notificationResponse,
  ) {
    final String? payload = notificationResponse.payload;

    if (payload != null && payload.isNotEmpty) {
      final Map<String, dynamic> data = json.decode(payload);

      _onNotificationOpenedController.sink.add(
        FcmNotificationDataModel(
          notificationType: NotificationType.foreground,
          data: data,
        ),
      );
    }
  }

  /// foreground, terminated, background 에서 눌렀을때 Notification Data 를 가져옴
  Stream<FcmNotificationDataModel> get onNotificationOpened {
    return _onNotificationOpenedController.stream;
  }

  /// foreground 에서 FCM Push 수신 👉 Bloc 에서 Local Notification 을 띄워줌
  Stream<FcmNotificationModel> get onForegroundNotification {
    return _onForegroundNotification.mapNotNull((message) {
      final notification = message.notification;

      if (notification == null) {
        return null;
      }

      return FcmNotificationModel(
        title: notification.title ?? '',
        body: notification.body ?? '',
        notificationType: NotificationType.foreground,
        data: message.data,
      );
    });
  }

  /// Local Notification 띄우기
  void showLocalNotification(FcmNotificationModel fcmNotificationModel) {
    final androidDetails = AndroidNotificationDetails(
      _channel.id,
      _channel.name,
      channelDescription: _channel.description,
      priority: Priority.max,
      importance: Importance.max,
      icon: 'mipmap/launcher_icon',
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    _localNotifications.show(
      0,
      fcmNotificationModel.title,
      fcmNotificationModel.body,
      platformDetails,
      payload: json.encode(fcmNotificationModel.data),
    );
  }
}
