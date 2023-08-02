part of 'fcm_notification_bloc.dart';

class FcmNotificationState extends Equatable {
  final FcmNotificationModel? fcmNotificationModel;

  const FcmNotificationState({this.fcmNotificationModel});

  const FcmNotificationState.initial() : this();

  FcmNotificationState copyWith({
    FcmNotificationModel? fcmNotificationModel,
  }) {
    return FcmNotificationState(
      fcmNotificationModel: fcmNotificationModel ?? this.fcmNotificationModel,
    );
  }

  @override
  List<Object?> get props => [fcmNotificationModel];

  @override
  bool? get stringify => false;
}
