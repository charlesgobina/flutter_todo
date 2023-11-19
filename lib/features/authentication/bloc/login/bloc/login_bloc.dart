// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:caasi_todo/features/authentication/data/repositories/firebase_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseRepository firebaseRepo;
  LoginBloc(
    this.firebaseRepo,
  ) : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(_onLoginButtonPressed);
  }

  // Stream<LoginState> mapEventToState(
  //   LoginEvent event,
  // ) async* {
  //   if (event is LoginButtonPressedEvent) {
  //     yield* _mapLoginButtonPressedEventToState(event);
  //   }
  // }

  // Stream<LoginState> _mapLoginButtonPressedEventToState(
  //     LoginButtonPressedEvent event) async* {
  //   yield LoginLoadingState();
  //   try {
  //     await firebaseRepo.signIn(email: event.email, password: event.password);
  //     yield LoginSuccessState();
  //   } catch (e) {
  //     yield LoginFailureState(error: e.toString());
  //   }
  // }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    try {
      await firebaseRepo.signIn(email: event.email, password: event.password);
      emit(LoginSuccessState());
    } catch (error) {
      if (error is FirebaseAuthException) {
        // Handle specific Firebase authentication exceptions here
        if (error.code == 'user-not-found') {
          const LoginFailureState(error: 'No user found for that email.');
        } else if (error.code == 'wrong-password') {
          const LoginFailureState(
              error: 'Wrong password provided for that user.');
        } else if (error.code == 'invalid-login-credentials') {
          const LoginFailureState(error: 'Invalid email or password provided.');
        } else if (error.code == 'user-disabled') {
          const LoginFailureState(error: 'User disabled.');
        } else if (error.code == 'too-many-requests') {
          const LoginFailureState(error: 'Too many requests. Try again later.');
        } else if (error.code == 'operation-not-allowed') {
          const LoginFailureState(error: 'Operation not allowed.');
        } else if (error.code == 'user-not-found') {
          emit(const LoginFailureState(error: 'No user found for that email.'));
        } else if (error.code == 'wrong-password') {
          emit(const LoginFailureState(
              error: 'Wrong password provided for that user.'));
        }

        emit(LoginFailureState(error: error.toString()));
      } else {
        // Handle other types of exceptions (if any)
        emit(
            LoginFailureState(error: 'An error occurred: ${error.toString()}'));
      }
    }
  }
}
