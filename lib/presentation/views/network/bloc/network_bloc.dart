import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_bloc.freezed.dart';

part 'network_event.dart';

part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(const NetworkState()) {
    on<NetworkNotifyEvent>((event, emit) => _setNotify(event, emit));
  }

  void _setNotify(
    NetworkNotifyEvent event,
    Emitter<NetworkState> emit,
  ) {
    emit(
      state.copyWith(
        networkStatus:
            event.isConnected ? NetworkStatus.success : NetworkStatus.failure,
        isConnected: event.isConnected,
      ),
    );
  }
}
