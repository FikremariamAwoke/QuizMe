import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial());
  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    // show or hide drawer
    if (event is DrawerShowEvent) yield DrawerShow();
    if (event is DrawerHideEvent) yield DrawerHide();
  }
}
