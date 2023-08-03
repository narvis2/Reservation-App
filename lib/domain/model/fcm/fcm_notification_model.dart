import 'package:equatable/equatable.dart';
import 'package:reservation_app/domain/model/fcm/enum/notification_type.dart';

class FcmNotificationModel extends Equatable {
  final String title;
  final String body;
  final NotificationType notificationType;
  final Map<String, dynamic> data;

  const FcmNotificationModel({
    required this.title,
    required this.body,
    required this.notificationType,
    required this.data,
  });

  @override
  List<Object?> get props => [
        title,
        body,
        notificationType,
        data,
      ];

  @override
  bool? get stringify => false;
}
