import 'package:dio/dio.dart';
import 'package:sportsapp/models/country_response_model.dart';

class CountryResponseRepo {
  final Dio dio = Dio();
  final String link = 'https://apiv2.allsportsapi.com/football';
  final String apikey = '7e18d00b65e40fdb3c62e5f089978bf7a7450284f92eea10e30efc4dc7787476';

  Future<CountryResponseModel> fetchCountries() async {
    Response response;
    try {
      response = await dio.get('$link/?met=Countries&APIkey=$apikey');
      if (response.statusCode == 200) {
        CountryResponseModel model = CountryResponseModel.fromJson(response.data);
        return model;
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      throw Exception('Failed to load countries: $e');
    }
  }
}
