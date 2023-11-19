import 'package:caasi_todo/features/authentication/bloc/auth/bloc/auth_bloc.dart';
import 'package:caasi_todo/features/authentication/bloc/login/bloc/login_bloc.dart';
import 'package:caasi_todo/features/authentication/data/repositories/firebase_repo.dart';
import 'package:caasi_todo/features/authentication/presentation/registration.dart';
import 'package:caasi_todo/features/todo/presentation/home/screens/todo_home.dart';
import 'package:caasi_todo/main.dart';
import 'package:flutter/material.dart';
import 'package:caasi_todo/widgets/widgets.dart';
import 'package:caasi_todo/widgets/typography.dart';
import 'package:caasi_todo/widgets/layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  final route = '/';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordHidden = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading:
              Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          title: Texto(
              text: "Login",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
            if (state is LoginSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodoHome(),
                ),
              );
              // navigatorKey.currentState!.pushNamed('/home');
            }
          },
          builder: (context, state) {
            if (state is LoginLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const LayoutGaps(gap: 0.05),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Email*'),
                                  const SizedBox(height: 5),
                                  Formfields.emailField(
                                    controller: _emailController,
                                    backColor: Theme.of(context)
                                        .copyWith()
                                        .focusColor
                                        .withOpacity(0.5),
                                    hint: "Enter your email",
                                    icon: Icon(Icons.email,
                                        color: Theme.of(context).primaryColor),
                                    obscureText: false,
                                  ),
                                ],
                              ),
                              const LayoutGaps(gap: 0.04),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Password*'),
                                  const SizedBox(height: 5),
                                  Formfields.passwordField(
                                    controller: _passwordController,
                                    hint: "Enter your password",
                                    icon: Icon(Icons.key,
                                        color: Theme.of(context).primaryColor),
                                    backColor: Theme.of(context)
                                        .copyWith()
                                        .focusColor
                                        .withOpacity(0.5),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isPasswordHidden =
                                                !isPasswordHidden;
                                          });
                                        },
                                        icon: Icon(
                                          isPasswordHidden
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Theme.of(context).primaryColor,
                                        )),
                                    obscureText: isPasswordHidden,
                                  ),
                                ],
                              ),
                              const LayoutGaps(gap: 0.05),
                              Formfields.formButton(
                                text: "Log in",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // LoginBloc(FirebaseRepository()).add(LoginButtonPressedEvent(email: _emailController.text, password: _passwordController.text));
                                    context.read<LoginBloc>().add(
                                          LoginButtonPressedEvent(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                  }
                                },
                                buttonColor: Theme.of(context).primaryColor,
                                borderColor: Theme.of(context).primaryColor,
                              ),
                              const LayoutGaps(gap: 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Texto(
                                      text: "Don't have an account?",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegistrationScreen(),
                                        ),
                                      );
                                    },
                                    child: Texto(
                                        text: "Register Now",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
