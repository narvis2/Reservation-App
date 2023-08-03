part of 'fcm_notification_bloc.dart';

class FcmNotificationState extends Equatable {
  final FcmNotificationDataModel? fcmNotificationDataModel;

  const FcmNotificationState({this.fcmNotificationDataModel});

  const FcmNotificationState.initial() : this();

  FcmNotificationState copyWith({
    FcmNotificationDataModel? fcmNotificationDataModel,
  }) {
    return FcmNotificationState(
      fcmNotificationDataModel: fcmNotificationDataModel ?? this.fcmNotificationDataModel,
    );
  }

  @override
  List<Object?> get props => [fcmNotificationDataModel];

  @override
  bool? get stringify => true;
}
