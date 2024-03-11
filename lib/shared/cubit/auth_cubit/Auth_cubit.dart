import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_service.dart';
import 'auth_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    try {
      bool isLoggedIn = await ApiService.signIn(email, password);
      if (isLoggedIn) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure());
      }
    } catch (e) {
      emit(LoginFailure());
    }
  }
}
