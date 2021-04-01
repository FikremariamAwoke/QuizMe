part of 'statistics_bloc.dart';

abstract class StatisticsEvent extends Equatable {
  const StatisticsEvent();
}

class LoadStatisticsData extends StatisticsEvent {
  @override
  List<Object> get props => [];
}
