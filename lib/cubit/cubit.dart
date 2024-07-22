import 'package:bloc/bloc.dart';
import 'package:flutter_application_sports_app/cubit/state.dart';
import 'package:flutter_application_sports_app/model/country_response_model.dart';
import 'package:flutter_application_sports_app/repos/country_response_repo.dart';
// import 'package:geolocator/geolocator.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  Future<void> getCountries() async {
    emit(GetDataLoading());

    try {
      CountryResponseModel response = await CountryResponseRepo().fetchCountries();
      emit(GetDataSuccess(response));
    } catch (e) {
      emit(GetDataError(e.toString()));
    }
  }

  // Future<void> getCurrentLocation() async {
  //   emit(GetDataLoading());

  //   try {
  //     bool serviceEnabled;
  //     LocationPermission permission;

  //     // Test if location services are enabled.
  //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //     if (!serviceEnabled) {
  //       emit(GetDataError("Location services are disabled."));
  //       return;
  //     }

  //     permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       if (permission == LocationPermission.denied) {
  //         emit(GetDataError("Location permissions are denied."));
  //         return;
  //       }
  //     }

  //     if (permission == LocationPermission.deniedForever) {
  //       emit(GetDataError(
  //           "Location permissions are permanently denied, we cannot request permissions."));
  //       return;
  //     }

  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);

  //     // Fetch the countries data
  //     CountryResponseModel response = await CountryResponseRepo().fetchCountries();

  //     emit(GetDataLocationSuccess(position: position, countryResponse: response));
  //   } catch (e) {
  //     emit(GetDataError("Error occurred while fetching location."));
  //   }
  // }
}