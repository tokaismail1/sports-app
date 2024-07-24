import 'package:bloc/bloc.dart';
import 'package:sportsapp/cubits/cubit/players_state.dart';
import 'package:sportsapp/models/players_model.dart';
import 'package:sportsapp/service/players_repo.dart';

class PlayersCubit extends Cubit<PlayersState> {
  final PlayersRepo playersRepo;
  List<Result>? allPlayers;
  List<Result>? filteredPlayers;

  PlayersCubit(this.playersRepo) : super(PlayersLoading());

  Future<void> fetchPlayers(int teamId) async {
    emit(PlayersLoading());
    try {
      ApiResponsePlayersModel? response = await playersRepo.getPlayers(teamId);
      if (response != null) {
        allPlayers = response.result; // Set allPlayers with the fetched data
        emit(PlayersSuccess(response));
      } else {
        emit(PlayersError());
      }
    } catch (e) {
      emit(PlayersError());
    }
  }

  void filterPlayers(String query) {
    if (query.isEmpty) {
      filteredPlayers = allPlayers; // Reset to all players if query is empty
    } else {
      filteredPlayers = allPlayers
          ?.where((player) =>
              player.playerName!.toLowerCase().replaceAll(" ", "").contains(query.toLowerCase().replaceAll(" ", "")))
          .toList();
    }
    emit(PlayersSuccess(ApiResponsePlayersModel(result: filteredPlayers)));
  }
}
