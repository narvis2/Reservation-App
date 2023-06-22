part of 'home_tab_bloc.dart';

abstract class HomeTabEvent extends Equatable {
  const HomeTabEvent();
}

class HomeTabEventBannerImage extends HomeTabEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}