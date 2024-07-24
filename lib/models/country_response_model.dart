class CountryResponseModel {
  final int success;
  final List<Country> result;

  CountryResponseModel({required this.success, required this.result});

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) {
    return CountryResponseModel(
      success: json['success'],
      result: List<Country>.from(json['result'].map((x) => Country.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'result': List<dynamic>.from(result.map((x) => x.toJson())),
    };
  }
}

class Country {
  late final int countryKey;
   late final countryName ;
   late final String? countryIso2;
    late final String? countryLogo ;

  Country({
    required this.countryKey,
    required this.countryName,
    this.countryIso2,
     this.countryLogo,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryKey: json['country_key'],
      countryName: json['country_name'],
      countryIso2: json['country_iso2'],
      countryLogo: json['country_logo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country_key': countryKey,
      'country_name': countryName,
      'country_iso2': countryIso2,
      'country_logo': countryLogo,
    };
  }
}
