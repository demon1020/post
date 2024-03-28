import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()){

    on<SignInEvent>((event, emit) async {
      String user = "user";
      String usersppl = "sppl";
      String pass = "test";
      if (event.username == user && event.password == pass) {
        await _saveCredentials(usersppl, pass, spplUser: false);
        return emit(AuthenticatedState());
      }

      if (event.username == usersppl && event.password == pass) {
        await _saveCredentials(usersppl, pass, spplUser: true);
        return emit(AuthenticatedState());
      }
      emit(UnauthenticatedState());
    });
  }

  Future<void> _saveCredentials(String username, password,
      {bool spplUser = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (spplUser) {
      await prefs.setBool('sppl', true);
    }else{
      await prefs.setBool('sppl', false);
    }
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }
}