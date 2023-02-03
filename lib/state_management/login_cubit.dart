import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit instance(BuildContext context) =>
      BlocProvider.of(context, listen: false);

  Future<void> readSharedPreferenceFields() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? userLoginStatus = prefs.getBool("USER_LOGIN_STATUS");
    final String? userName = prefs.getString("USER_NAME");
    emit(UserAlreadyLogged());
  }
}
