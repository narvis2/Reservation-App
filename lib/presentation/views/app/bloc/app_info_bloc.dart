import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_info_bloc.freezed.dart';

part 'app_info_event.dart';

part 'app_info_state.dart';

class AppInfoBloc extends Bloc<AppInfoEvent, AppInfoState> {
  AppInfoBloc() : super(const AppInfoState()) {
    on<AppInfoGetEvent>((event, emit) => _setAppInfo(event, emit));
  }

  FutureOr<void> _setAppInfo(
    AppInfoGetEvent event,
    Emitter<AppInfoState> emit,
  ) async {
    final PackageInfo appInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(appInfo: appInfo));
  }
}
