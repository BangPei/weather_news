import 'package:another_flushbar/flushbar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_news/helpers/interceptor/injector.dart';
import 'package:weather_news/helpers/interceptor/navigation_service.dart';
import 'package:weather_news/helpers/session_manager.dart';
import 'package:weather_news/home/home_screen.dart';
import 'package:weather_news/router/app_router.dart';
import 'package:weather_news/router/app_routers.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final NavigationService _nav = locator<NavigationService>();
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>(
      (event, emit) {
        if (event is OnChangeUsername) {
          emit(_onUsernameChange(event, state));
        }
        if (event is OnChangePassword) {
          emit(_onPasswordChange(event, state));
        }
        if (event is LoginSubmitted) {
          emit(_onLoginSubmitted(event, state));
        }
        if (event is LogoutSubmitted) {
          emit(_onLogoutSubmite(event, state));
        }
      },
    );
  }

  LoginState _onUsernameChange(OnChangeUsername event, LoginState state) {
    final String username = event.value;
    return state.copyWith(username: username);
  }

  LoginState _onPasswordChange(OnChangePassword event, LoginState state) {
    final String password = event.value;
    return state.copyWith(password: password);
  }

  _onLoginSubmitted(LoginSubmitted event, LoginState state) async {
    BuildContext _context = _nav.navigatorKey.currentContext!;
    bool isUsername = await Session.checkValue("username");
    bool isPassword = await Session.checkValue("password");
    if (isUsername && isPassword) {
      String _username = await Session.get("username");
      String _password = await Session.get("password");
      if (_username == state.username && _password == state.password) {
        Navigator.pushAndRemoveUntil(
            _context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      } else {
        print("Login Failed");
      }
    } else {
      Flushbar(
        title: "Login Failed",
        message: "Username is not registered, Please register to continue !",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.redAccent,
      )..show(_context);
    }
  }

  _onLogoutSubmite(LogoutSubmitted event, LoginState state) async {
    BuildContext _context = _nav.navigatorKey.currentContext!;
    await Session.clear();
    AppRouter.router.navigateTo(
      _context,
      AppRoutes.loginRoute.route,
      replace: true,
      clearStack: true,
    );
  }
}
