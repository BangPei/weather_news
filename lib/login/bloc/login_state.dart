part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? username, password;
  final bool isLoading;
  const LoginState({
    this.username,
    this.password,
    this.isLoading = false,
  });

  LoginState copyWith({
    username,
    password,
    isLoading,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading ?? false,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        isLoading,
      ];
}
