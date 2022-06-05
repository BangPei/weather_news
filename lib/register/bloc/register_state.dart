part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String? username;
  final String? password;

  RegisterState({this.password, this.username});
  RegisterState copyWith({username, password}) {
    return RegisterState(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
