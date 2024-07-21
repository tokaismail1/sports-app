import 'package:dio/dio.dart';
import 'package:sportsapp/models/team_screen_model.dart';

class TeamService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://apiv2.allsportsapi.com/football/';

  Future<List<Team>> fetchTeams(String leagueId) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'met': 'Teams',
          'leagueId': leagueId,
          'APIkey': '6344799f250f211eb21ad9d8192577aab0962f5f2de1ba507de2f6e7cf0c7a82',
        },
      );

      print('Response data: ${response.data}');
      final List<dynamic> teamJson = response.data['result'];
      return teamJson.map((json) => Team.fromJson(json)).toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
