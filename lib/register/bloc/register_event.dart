part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class OnChangeUsername extends RegisterEvent {
  final String username;
  OnChangeUsername(this.username);
}

class OnChangePassword extends RegisterEvent {
  final String password;
  OnChangePassword(this.password);
}

class OnSubmitRegister extends RegisterEvent {
  OnSubmitRegister();
}
