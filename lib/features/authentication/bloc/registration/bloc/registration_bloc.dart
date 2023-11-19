// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:caasi_todo/features/authentication/data/repositories/firebase_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final FirebaseRepository firebaseRepo;
  RegistrationBloc(
    this.firebaseRepo,
  ) : super(RegistrationInitialState()) {
    on<RegistrationButtonPressedEvent>(_onRegistrationButtonPressed);
  }

  Future<void> _onRegistrationButtonPressed(
    RegistrationButtonPressedEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationLoadingState());
    try {
      await firebaseRepo.signUp(
        name: event.name,
        phoneNumber: event.phoneNumber,
        email: event.email,
        password: event.password,
      );
      emit(RegistrationSuccessState());
    } catch (error) {
      emit(RegistrationFailureState(error: error.toString()));
    }
  }
}
