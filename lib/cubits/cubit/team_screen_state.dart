part of 'team_screen_cubit.dart';


abstract class TeamsScreenState {}

class TeamsScreenInitial extends TeamsScreenState {}

class TeamsScreenLoading extends TeamsScreenState {}

class TeamsScreenLoaded extends TeamsScreenState {
  final List<Team> teams;
  final List<Team> filteredTeams;

  TeamsScreenLoaded({required this.teams, List<Team>? filteredTeams})
      : filteredTeams = filteredTeams ?? teams;
}

class TeamsScreenError extends TeamsScreenState {
  final String error;

  TeamsScreenError({required this.error});
}
