part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthInProgressState extends AuthState {}

class AuthenticationSuccessState extends AuthState {
  final User? user;
  const AuthenticationSuccessState({this.user});
  @override
  List<Object> get props => [user!];
}

class AuthenticationNotSucessState extends AuthState {}

class AuthenticationLoggedOutState extends AuthState {}

class AuthenticationFailureState extends AuthState {
  final String error;

  const AuthenticationFailureState(this.error);

  @override
  List<Object> get props => [error];
}
