part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class DrawerShow extends MainState {
  @override
  List<Object> get props => [];
}

class DrawerHide extends MainState {
  @override
  List<Object> get props => [];
}
