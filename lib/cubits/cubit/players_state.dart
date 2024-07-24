import 'package:sportsapp/models/players_model.dart';

sealed class PlayersState {}

//class PlayersInitial extends PlayersState {}

class PlayersLoading extends PlayersState {}

class PlayersSuccess extends PlayersState
{
  final  ApiResponsePlayersModel responceModel;
  PlayersSuccess(this.responceModel);
}

class PlayersError extends PlayersState {}