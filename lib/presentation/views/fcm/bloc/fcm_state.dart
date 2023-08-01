part of 'fcm_bloc.dart';

abstract class FcmState extends Equatable {
  const FcmState();
}

class FcmInitial extends FcmState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
