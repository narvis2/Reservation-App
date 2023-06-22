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