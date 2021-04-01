part of 'statistics_bloc.dart';

abstract class StatisticsState extends Equatable {
  const StatisticsState();
}

class StatisticsInitial extends StatisticsState {
  @override
  List<Object> get props => [];
}

class StatisticsDataLoading extends StatisticsState {
  @override
  List<Object> get props => [];
}

class StatisticsDataLoaded extends StatisticsState {
  final Stats stats;
  StatisticsDataLoaded({this.stats});
  @override
  List<Object> get props => [stats];
}
