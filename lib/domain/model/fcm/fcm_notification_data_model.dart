
import 'package:equatable/equatable.dart';
import 'package:reservation_app/domain/model/fcm/enum/notification_type.dart';

class FcmNotificationDataModel extends Equatable {
  final NotificationType notificationType;
  final Map<String, dynamic> data;

  const FcmNotificationDataModel({
    required this.notificationType,
    required this.data,
  });

  @override
  List<Object?> get props => [
    notificationType,
    data,
  ];

  @override
  bool? get stringify => true;
}