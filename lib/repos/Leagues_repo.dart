import 'package:dio/dio.dart';

class LeaguesRepo {
  final Dio dio;
  final String baseurl = 'https://apiv2.allsportsapi.com/football';
  final String apikey = '31d6347d9e56090fc8af9a9f3bda4bb4542ec53bc24cdca14a43f887bb55f45a';

  LeaguesRepo(this.dio);

  Future<Map<String, dynamic>> getLeagues(String countryName) async {
    try {
      Response response = await dio.get(
        '$baseurl/?met=Leagues&APIkey=$apikey&countryName=$countryName',
      );
      return response.data;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, there was an error. Try again later.';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Oops, try again later.');
    }
  }
}
