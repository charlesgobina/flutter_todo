import 'package:caasi_todo/features/authentication/bloc/registration/bloc/registration_bloc.dart';
import 'package:caasi_todo/features/authentication/presentation/login.dart';
import 'package:caasi_todo/main.dart';
import 'package:flutter/material.dart';
import 'package:caasi_todo/widgets/widgets.dart';
import 'package:caasi_todo/widgets/typography.dart';
import 'package:caasi_todo/widgets/layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  final route = '/';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordHidden = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // back arrow that goes back to previous page

          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
            onPressed: () => {Navigator.pop(context)},
          ),
          title: Texto(
              text: "Signup",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state is RegistrationFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
            if (state is RegistrationSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
              );
              // navigatorKey.currentState!.pushNamed('/home');
            }
          },
          builder: (context, state) {
            if (state is RegistrationLoadingState) {
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
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Full Name*'),
                                      const SizedBox(height: 5),
                                      Formfields.nameField(
                                        controller: _nameController,
                                        backColor: Theme.of(context)
                                            .copyWith()
                                            .focusColor
                                            .withOpacity(0.5),
                                        hint: "Enter your name",
                                        icon: Icon(Icons.person,
                                            color:
                                                Theme.of(context).primaryColor),
                                        obscureText: false,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const LayoutGaps(gap: 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Phone Number*'),
                                  const SizedBox(height: 5),
                                  Formfields.nameField(
                                    controller: _phoneNumberController,
                                    backColor: Theme.of(context)
                                        .copyWith()
                                        .focusColor
                                        .withOpacity(0.5),
                                    hint: "Enter your phone number",
                                    icon: Icon(Icons.phone,
                                        color: Theme.of(context).primaryColor),
                                    obscureText: false,
                                  ),
                                ],
                              ),
                              const LayoutGaps(gap: 0.02),
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
                              const LayoutGaps(gap: 0.02),
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
                                text: "Create Account",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<RegistrationBloc>().add(
                                          RegistrationButtonPressedEvent(
                                            name: _nameController.text,
                                            phoneNumber:
                                                _phoneNumberController.text,
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
                                      text: "Have an accout already?",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      navigatorKey.currentState!
                                          .pushNamed(const LoginScreen().route);
                                    },
                                    child: Texto(
                                        text: "Login Now",
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
