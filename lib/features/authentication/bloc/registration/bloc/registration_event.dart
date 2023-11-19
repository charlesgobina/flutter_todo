// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationButtonPressedEvent extends RegistrationEvent {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;

  const RegistrationButtonPressedEvent({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password, name, phoneNumber];
}
