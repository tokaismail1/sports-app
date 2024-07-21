import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportsapp/models/team_screen_model.dart';
import 'package:sportsapp/service/teamsrepo.dart';

part 'team_screen_state.dart';



class TeamsScreenCubit extends Cubit<TeamsScreenState> {
  final TeamService _teamService;

  TeamsScreenCubit(this._teamService) : super(TeamsScreenInitial());

  Future<void> fetchTeams(String leagueId) async {
    emit(TeamsScreenLoading());
    try {
      final teams = await _teamService.fetchTeams(leagueId);
      emit(TeamsScreenLoaded(teams: teams));
    } catch (e) {
      emit(TeamsScreenError(error: e.toString()));
    }
  }

  void filterTeams(String query, List<Team> teams) {
    final filtered = teams.where((team) {
      final teamName = team.teamName.toLowerCase();
      final input = query.toLowerCase();
      return teamName.contains(input);
    }).toList();
    emit(TeamsScreenLoaded(teams: teams, filteredTeams: filtered));
  }
}
