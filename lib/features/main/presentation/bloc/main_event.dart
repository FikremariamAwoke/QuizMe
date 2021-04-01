part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class DrawerShowEvent extends MainEvent {
  @override
  List<Object> get props => [];
}

class DrawerHideEvent extends MainEvent {
  @override
  List<Object> get props => [];
}
