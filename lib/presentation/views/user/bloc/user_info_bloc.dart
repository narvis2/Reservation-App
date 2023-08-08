import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';

part 'user_info_bloc.freezed.dart';

part 'user_info_event.dart';

part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final SharedPreferenceModule _pref;

  UserInfoBloc(
    this._pref,
  ) : super(UserInfoState()) {
    on<UserInfoInitEvent>((event, emit) => _setInitState(event, emit));
  }

  void _setInitState(UserInfoInitEvent event, Emitter<UserInfoState> emit) {

  }
}
