import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/usecase/sign/request_sign_in_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/request_sign_out_use_case.dart';

part 'sign_event.dart';

part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final RequestSignInUseCase _requestSignInUseCase;
  final RequestSignOutUseCase _requestSignOutUseCase;

  SignBloc(
    this._requestSignInUseCase,
    this._requestSignOutUseCase,
  ) : super(SignInitial()) {
    on<SignEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
