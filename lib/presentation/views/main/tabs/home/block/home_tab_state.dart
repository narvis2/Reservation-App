part of 'home_tab_bloc.dart';

abstract class HomeTabState extends Equatable {
  const HomeTabState();
}

class HomeTabInitial extends HomeTabState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class HomeTabStateLoading extends HomeTabState {
  const HomeTabStateLoading();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class HomeTabStateBannerImages extends HomeTabState {
  final List<BannerImageModel> bannerImages;

  const HomeTabStateBannerImages({required this.bannerImages});

  @override
  List<Object?> get props => [bannerImages];

  @override
  bool? get stringify => false;
}

class HomeTabStateBannerImagesFailed extends HomeTabState {
  final String message;

  const HomeTabStateBannerImagesFailed({required this.message});

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}