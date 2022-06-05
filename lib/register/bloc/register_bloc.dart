import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_news/helpers/interceptor/injector.dart';
import 'package:weather_news/helpers/interceptor/navigation_service.dart';
import 'package:weather_news/helpers/session_manager.dart';
import 'package:weather_news/login/login_screen.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final NavigationService _nav = locator<NavigationService>();
  RegisterBloc() : super(RegisterState()) {
    on<RegisterEvent>(
      (event, emit) async {
        if (event is OnChangeUsername) {
          emit(_onUsernameChange(event, state));
        }
        if (event is OnChangePassword) {
          emit(_onPasswordChange(event, state));
        }
        if (event is OnSubmitRegister) {
          _onRegisterSubmit(event, state);
        }
      },
    );
  }

  RegisterState _onUsernameChange(OnChangeUsername event, RegisterState state) {
    final String username = event.username;
    return state.copyWith(username: username);
  }

  RegisterState _onPasswordChange(OnChangePassword event, RegisterState state) {
    final String password = event.password;
    return state.copyWith(password: password);
  }

  _onRegisterSubmit(OnSubmitRegister event, RegisterState state) async {
    await Session.set("username", state.username!);
    await Session.set("password", state.password!);
    Navigator.pushAndRemoveUntil(
        _nav.navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }
}
