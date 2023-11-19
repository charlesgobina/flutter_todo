import 'package:caasi_todo/config/themes/theme.dart';
import 'package:caasi_todo/features/authentication/bloc/auth/bloc/auth_bloc.dart';
import 'package:caasi_todo/features/authentication/bloc/login/bloc/login_bloc.dart';
import 'package:caasi_todo/features/authentication/bloc/registration/bloc/registration_bloc.dart';
import 'package:caasi_todo/features/authentication/data/repositories/firebase_repo.dart';
import 'package:caasi_todo/features/authentication/presentation/login.dart';
import 'package:caasi_todo/features/authentication/presentation/registration.dart';
import 'package:caasi_todo/features/todo/domain/bloc/todo_bloc.dart';
import 'package:caasi_todo/features/todo/presentation/home/screens/todo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Todo());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// class todo stateless widget

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(FirebaseRepository()),
        ),
        BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(FirebaseRepository()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            FirebaseRepository(),
          ),
        ),
        BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        title: 'Todo App',
        initialRoute: '/',
        routes: {
          '/home': (context) => BlocProvider.value(
                value: TodoBloc(),
                child: const TodoHome(),
              ),
          '/': (context) => BlocProvider.value(
                value: LoginBloc(
                  FirebaseRepository(),
                ),
                child: const LoginScreen(),
              ),
          '/registration': (context) => BlocProvider.value(
                value: RegistrationBloc(
                  FirebaseRepository(),
                ),
                child: const RegistrationScreen(),
              ),
        },
        // home: BlocProvider(
        //   create: (context) => TodoBloc(),
        //   child: const TodoHome(),
        // ),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
