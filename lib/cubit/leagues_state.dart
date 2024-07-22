part of 'leagues_cubit.dart';

@immutable
sealed class LeaguesState {}

final class LeaguesInitial extends LeaguesState {}

final class LeaguesLoading extends LeaguesState {}

final class LeaguesSuccess extends LeaguesState {
   List<LeaguesModel> leagues;
  LeaguesSuccess(this.leagues);
}

final class LeaguesFailure extends LeaguesState {}