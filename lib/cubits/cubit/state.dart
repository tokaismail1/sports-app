import 'package:equatable/equatable.dart';
import 'package:sportsapp/models/country_response_model.dart';

abstract class GetDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetDataInitial extends GetDataState {}

class GetDataLoading extends GetDataState {}

class GetDataSuccess extends GetDataState {
  final CountryResponseModel countryResponse;

  GetDataSuccess(this.countryResponse);

  @override
  List<Object?> get props => [countryResponse];
}

class GetDataError extends GetDataState {
  final String message;

  GetDataError(this.message);

  @override
  List<Object?> get props => [message];
}









/*import 'package:sportsapp/models/country_response_model.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:sportsapp/cubits/cubit/cubit.dart';

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
// }*/