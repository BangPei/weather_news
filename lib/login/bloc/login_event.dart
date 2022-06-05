part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class OnChangeUsername extends LoginEvent {
  final String value;
  OnChangeUsername(this.value);
}

class OnChangePassword extends LoginEvent {
  final String value;
  OnChangePassword(this.value);
}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted();
}

class LogoutSubmitted extends LoginEvent {
  LogoutSubmitted();
}
