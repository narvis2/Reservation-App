part of 'fcm_notification_bloc.dart';

abstract class FcmNotificationEvent extends Equatable {
  const FcmNotificationEvent();
}

class _FcmNotificationOpenedEvent extends FcmNotificationEvent {
  final FcmNotificationModel fcmNotificationModel;

  const _FcmNotificationOpenedEvent({required this.fcmNotificationModel});

  @override
  List<Object?> get props => [fcmNotificationModel];

  @override
  bool? get stringify => false;
}

class _FcmNotificationForegroundReceivedEvent extends FcmNotificationEvent {
  final FcmNotificationModel fcmNotificationModel;

  const _FcmNotificationForegroundReceivedEvent({required this.fcmNotificationModel});

  @override
  List<Object?> get props => [fcmNotificationModel];

  @override
  bool? get stringify => false;
}
