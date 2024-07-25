
import 'package:sportsapp/models/country_response_model.dart';
// import 'package:geolocator/geolocator.dart';

abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class GetDataLoading extends GetDataState {}

class GetDataSuccess extends GetDataState {
  final CountryResponseModel countryResponse;

  GetDataSuccess(this.countryResponse);
}

class GetDataError extends GetDataState {
  final String message;

  GetDataError(this.message);
}

// class GetDataLocationSuccess extends GetDataState {
//   final Position position;
//   final CountryResponseModel countryResponse;

//   GetDataLocationSuccess({required this.position, required this.countryResponse});
// }