import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_loading_state.dart';

class LoginLoadingCubit extends Cubit<LoginLoadingState> {
  LoginLoadingCubit() : super(LoginLoadingInitial());
  void isloading() {
    emit(LoginLoadingInitial());
  }
}
