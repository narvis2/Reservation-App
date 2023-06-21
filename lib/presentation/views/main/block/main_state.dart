part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainStateInitial extends MainState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class MainStateLoading extends MainState {
  const MainStateLoading();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class MainStateBannerImages extends MainState {
  final List<BannerImageModel> bannerImages;

  const MainStateBannerImages({required this.bannerImages});

  @override
  List<Object?> get props => [bannerImages];

  @override
  bool? get stringify => false;
}

class MainStateBannerImagesFailed extends MainState {
  final String message;

  const MainStateBannerImagesFailed({required this.message});

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}