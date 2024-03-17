import 'package:exams_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
<<<<<<< HEAD
=======
    emit(LoginLoading());
>>>>>>> e71ff4b00835062775c4e235dd29b7b80478289d
    try {
      bool isLoggedIn = await DioHelper.signIn(email, password);
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
