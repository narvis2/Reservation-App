import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'fcm_event.dart';

part 'fcm_state.dart';

class FcmBloc extends Bloc<FcmEvent, FcmState> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String token = "";
  final _localNotifications = FlutterLocalNotificationsPlugin();

  FcmBloc() : super(FcmInitial()) {
    on<FcmInit>((event, emit) => _initFCM(event, emit));
  }

  Future<void> _initFCM(FcmEvent event, Emitter<FcmState> emitter) async {
    debugPrint("📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌");
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          AndroidNotificationChannel(
            'woo_hoe_dam_channel',
            'woo_hoe_dam',
            description: 'Reservation for woo hoe dam',
            importance: Importance.high,
          ),
        );

    await _localNotifications.initialize(const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestCriticalPermission: false,
      )
    ));

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Foreground 환경
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {});

    // Background 환경
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {});

    // Terminate 환경
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {});

    _firebaseMessaging.onTokenRefresh.listen((String fcmToken) {
      debugPrint('🔔 Fcm Refresh Token 👉 $fcmToken}');
      token = fcmToken;
    });

    _firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);

    _firebaseMessaging.getToken().then((String? fcmToken) {
      if (fcmToken != null) {
        debugPrint('🔔 fcmToken 👉 $fcmToken}');
        token = fcmToken;
      }
    });
  }

  Future<void> _onBackgroundMessage(RemoteMessage message) async {
    debugPrint("🔔 _onBackgroundMessage 👉 $message");
  }
}
