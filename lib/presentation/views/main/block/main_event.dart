part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainEventBannerImages extends MainEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
