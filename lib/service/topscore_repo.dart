import 'package:dio/dio.dart';
import 'package:sportsapp/models/topscore_model.dart';

class TopScorerService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://apiv2.allsportsapi.com/football/';

  Future<List<TopScorer>> fetchTopScorers(String leagueId) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'met': 'Topscorers',
        'leagueId': leagueId,
        'APIkey': '6344799f250f211eb21ad9d8192577aab0962f5f2de1ba507de2f6e7cf0c7a82',
      },
    );

    final List<dynamic> topScorerJson = response.data['result'];
    return topScorerJson.map((json) => TopScorer.fromJson(json)).toList();
  }
}
