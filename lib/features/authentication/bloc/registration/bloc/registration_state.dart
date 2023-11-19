part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationFailureState extends RegistrationState {
  final String error;

  const RegistrationFailureState({required this.error});

  @override
  List<Object> get props => [error];
}
