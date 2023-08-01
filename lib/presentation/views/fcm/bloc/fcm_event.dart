part of 'fcm_bloc.dart';

abstract class FcmEvent extends Equatable {
  const FcmEvent();
}

class FcmInit extends FcmEvent {
  const FcmInit();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}