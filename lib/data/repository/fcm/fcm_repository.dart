import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/domain/model/fcm/enum/notification_type.dart';
import 'package:reservation_app/domain/model/fcm/fcm_notification_model.dart';
import 'package:rxdart/rxdart.dart';

class FcmRepository {
  final FirebaseMessaging _firebaseMessaging;
  final Stream<RemoteMessage> _onForegroundNotification;
  final BehaviorSubject<FcmNotificationModel> _onNotificationOpenedController;

  FcmRepository({
    FirebaseMessaging? firebaseMessaging,
    Stream<RemoteMessage>? onNotificationOpened,
    Stream<RemoteMessage>? onForegroundNotification,
  })  : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance,
        _onForegroundNotification =
            onForegroundNotification ?? FirebaseMessaging.onMessage,
        _onNotificationOpenedController =
            BehaviorSubject<FcmNotificationModel>() {
    _initialize(onNotificationOpened ?? FirebaseMessaging.onMessageOpenedApp);
  }

  Future<void> _initialize(Stream<RemoteMessage> onNotificationOpened) async {
    debugPrint("🔔 FcmRepository _initialize Called 🔔");
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
        debugPrint("🔔 getInitialMessage > Terminate 👉 $message");
        _onMessageOpened(message, NotificationType.terminated);
      }

      // 📌 Background 환경
      onNotificationOpened.listen((event) {
        debugPrint("🔔 onMessageOpenedApp > background notification 👉 ${event.notification}");
        debugPrint("🔔 onMessageOpenedApp > background notification 👉 ${event.data}");
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

  void _onMessageOpened(
      RemoteMessage message, NotificationType notificationType) {
    final RemoteNotification? notification = message.notification;
    if (notification != null) {
      _onNotificationOpenedController.sink.add(FcmNotificationModel(
        title: notification.title ?? '',
        body: notification.body ?? '',
        notificationType: notificationType,
      ));
    }
  }

  /// terminated, background 에서 눌러서 들어오는 경우 Notification Data 를 가져옴
  Stream<FcmNotificationModel> get onNotificationOpened {
    return _onNotificationOpenedController.stream;
  }

  Stream<FcmNotificationModel> get onForegroundNotification {
    return _onForegroundNotification.mapNotNull((message) {
      debugPrint("🔔 FirebaseMessaging.onMessage 👉 $message");

      final notification = message.notification;

      if (notification == null) {
        return null;
      }

      return FcmNotificationModel(
        title: notification.title ?? '',
        body: notification.body ?? '',
        notificationType: NotificationType.foreground,
      );
    });
  }
}
