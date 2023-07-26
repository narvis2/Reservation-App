part of 'network_bloc.dart';

@freezed
class NetworkEvent with _$NetworkEvent {
  const factory NetworkEvent.networkNotify({
    required bool isConnected,
  }) = NetworkNotifyEvent;
}
