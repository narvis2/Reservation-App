import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/data/repository/fcm/fcm_repository.dart';
import 'package:reservation_app/domain/model/fcm/fcm_notification_model.dart';

part 'fcm_notification_event.dart';

part 'fcm_notification_state.dart';

class FcmNotificationBloc
    extends Bloc<FcmNotificationEvent, FcmNotificationState> {
  final FcmRepository _fcmRepository;

  FcmNotificationBloc(this._fcmRepository)
      : super(FcmNotificationState.initial()) {
    on<_FcmNotificationOpenedEvent>(
      (event, emit) => _onNotificationOpened(event, emit),
    );
    on<_FcmNotificationForegroundReceivedEvent>(
      (event, emit) => _onNotificationInForegroundReceived(event, emit),
    );

    _fcmRepository.onNotificationOpened.listen(
      (notification) {
        add(_FcmNotificationOpenedEvent(fcmNotificationModel: notification));
      },
    );

    _fcmRepository.onForegroundNotification.listen(
      (notification) {
        add(_FcmNotificationForegroundReceivedEvent(fcmNotificationModel: notification));
      },
    );
  }

  void _onNotificationOpened(
    _FcmNotificationOpenedEvent event,
    Emitter<FcmNotificationState> emit,
  ) {
    emit(
      state.copyWith(fcmNotificationModel: event.fcmNotificationModel),
    );
  }

  void _onNotificationInForegroundReceived(
    _FcmNotificationForegroundReceivedEvent event,
    Emitter<FcmNotificationState> emit,
  ) {
    emit(
      state.copyWith(fcmNotificationModel: event.fcmNotificationModel),
    );
  }
}
