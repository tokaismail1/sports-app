import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:sportsapp/models/Leagues_model.dart';
import 'package:sportsapp/service/Leagues_repo.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  LeaguesCubit(this.leaguesService) : super(LeaguesInitial());
  LeaguesService leaguesService;

  Future<void> getLeagues() async {
    try {
      emit(LeaguesLoading());

      var data = await leaguesService.getLeaugues();
      List<LeaguesModel> leaguesList = [];
      for (var item in data['result']) {
        leaguesList.add(LeaguesModel.fromJson(item));
      }

      emit(LeaguesSuccess(leaguesList));
    } catch (e) {
      print(e.toString());
      emit(LeaguesFailure());
    }
  }
}
