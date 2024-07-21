part of 'topscore_cubit.dart';

@immutable
abstract class TopScorerState {}

class TopScorerInitial extends TopScorerState {}

class TopScorerLoading extends TopScorerState {}

class TopScorerLoaded extends TopScorerState {
  final List<TopScorer> topScorers;

  TopScorerLoaded(this.topScorers);
}

class TopScorerError extends TopScorerState {
  final String message;

  TopScorerError(this.message);
}
