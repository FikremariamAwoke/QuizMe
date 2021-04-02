import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:localstorage/localstorage.dart';

// models
import '../../data/models/Stats.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsInitial());
  @override
  Stream<StatisticsState> mapEventToState(
    StatisticsEvent event,
  ) async* {
    if (event is LoadStatisticsData) {
      // yield loading state
      yield StatisticsDataLoading();

      // get data from storage
      final LocalStorage storage = new LocalStorage('Quiz');
      await storage.ready;

      Stats stats = new Stats(
        riddlesCorrectlyAnswered:
            await storage.getItem("riddlesCorrectlyAnswered"),
        riddlesTotalAnswered: await storage.getItem("riddlesTotalAnswered"),
        generalKnowledgeCorrectlyAnswered:
            await storage.getItem("generalKnowledgeCorrectlyAnswered"),
        generalKnowledgeTotalAnswered:
            await storage.getItem("generalKnowledgeTotalAnswered"),
        computerScienceCorrectlyAnswered:
            await storage.getItem("computerScienceCorrectlyAnswered"),
        computerScienceTotalAnswered:
            await storage.getItem("computerScienceTotalAnswered"),
        geographyCorrectlyAnswered:
            await storage.getItem("geographyCorrectlyAnswered"),
        geographyTotalAnswered: await storage.getItem("geographyTotalAnswered"),
        artCorrectlyAnswered: await storage.getItem("artCorrectlyAnswered"),
        artTotalAnswered: await storage.getItem("artTotalAnswered"),
        sportCorrectlyAnswered: await storage.getItem("sportCorrectlyAnswered"),
        sportTotalAnswered: await storage.getItem("sportTotalAnswered"),
      );

      // yield data loaded from storage
      yield StatisticsDataLoaded(stats: stats);
    }
  }
}
