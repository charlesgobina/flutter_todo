import 'dart:async';
import 'dart:math';
import 'package:caasi_todo/features/authentication/data/repositories/firebase_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseRepository firebaseRepo;
  AuthBloc(this.firebaseRepo) : super(AuthInitialState()) {
    on<AuthenticationLoggedInEvent>(_onAuthLoggedIn);
    on<AuthenticationLoggedOutEvent>(_onAuthLoggedOut);
  }

  _onAuthLoggedIn(
    AuthenticationLoggedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInProgressState());
    try {
      bool isSignedIn = await firebaseRepo.isSignedIn();
      if (isSignedIn) {
        final user = await firebaseRepo.getUser();
        emit(AuthenticationSuccessState(user: user));
      } else {
        emit(AuthenticationNotSucessState());
      }
    } catch (error) {
      emit(AuthenticationFailureState(error.toString()));
    }
  }

  _onAuthLoggedOut(
    AuthenticationLoggedOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInProgressState());
    try {
      await firebaseRepo.signOut();
      emit(AuthenticationLoggedOutState());
    } catch (error) {
      emit(AuthenticationFailureState(error.toString()));
    }
  }
}
