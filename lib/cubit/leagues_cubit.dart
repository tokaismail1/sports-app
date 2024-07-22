import 'package:bloc/bloc.dart';
import 'package:flutter_application_sports_app/model/leagues_model.dart';
import 'package:flutter_application_sports_app/repos/Leagues_repo.dart';
import 'package:meta/meta.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  final LeaguesRepo leaguesRepo;

  LeaguesCubit(this.leaguesRepo) : super(LeaguesInitial());

  Future<void> getLeagues(String countryName) async {
    emit(LeaguesLoading());
    try {
      var data = await leaguesRepo.getLeagues(countryName);
      List<LeaguesModel> leaguesList = [];
      for (var item in data['result']) {
        leaguesList.add(LeaguesModel.fromJson(item));
      }
      emit(LeaguesSuccess(leaguesList));
    } catch (e) {
      emit(LeaguesFailure());
    }
  }
}
