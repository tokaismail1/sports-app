import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportsapp/models/topscore_model.dart';
import 'package:sportsapp/service/topscore_repo.dart';

part 'topscore_state.dart';



class TopScorerCubit extends Cubit<TopScorerState> {
  final TopScorerService _topScorerService;

  TopScorerCubit(this._topScorerService) : super(TopScorerInitial());

  void fetchTopScorers(String leagueId) async {
    try {
      emit(TopScorerLoading());
      final topScorers = await _topScorerService.fetchTopScorers(leagueId);
      emit(TopScorerLoaded(topScorers));
    } catch (e) {
      emit(TopScorerError("Failed to fetch top scorers"));
    }
  }
}
