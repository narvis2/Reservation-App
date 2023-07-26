part of 'network_bloc.dart';

enum NetworkStatus {
  initial,
  success,
  failure
}

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState({
    @Default(NetworkStatus.initial) NetworkStatus networkStatus,
    @Default(false) bool isConnected,
  }) = Initial;
}