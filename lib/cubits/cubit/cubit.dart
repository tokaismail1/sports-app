
import 'package:bloc/bloc.dart';
import 'package:sportsapp/cubits/cubit/state.dart';
import 'package:sportsapp/service/country_response_repo.dart';

class GetDataCubit extends Cubit<GetDataState> {
  final CountryResponseRepo countryResponseRepo;

  GetDataCubit(this.countryResponseRepo) : super(GetDataInitial());

  Future<void> getCountries() async {
    try {
      emit(GetDataLoading());
      final countries = await countryResponseRepo.fetchCountries();
      emit(GetDataSuccess(countries));
    } catch (e) {
      emit(GetDataError(e.toString()));
    }
  }
}







/*import 'package:bloc/bloc.dart';
import 'package:sportsapp/cubits/cubit/state.dart';
import 'package:sportsapp/models/country_response_model.dart';
import 'package:sportsapp/service/country_response_repo.dart';
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
}*/