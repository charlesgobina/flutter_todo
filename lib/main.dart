import 'package:caasi_todo/config/themes/theme.dart';
import 'package:caasi_todo/features/todo/domain/bloc/todo_bloc.dart';
import 'package:caasi_todo/features/todo/presentation/home/screens/todo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Todo());
}

// class todo stateless widget

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      title: 'Todo App',
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child: const TodoHome(),
      ),
    );
  }
}
