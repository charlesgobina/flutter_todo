part of 'todo_bloc.dart';

@immutable
sealed class TodoState {
  Iterable get todos => [];
}

final class TodoInitial extends TodoState {
  TodoInitial();
}

class TodoAtRestState extends TodoState {
  final List<TodoModel> todos;
  TodoAtRestState({
    required this.todos,
  });
}

// add todo state
class TodoAddState extends TodoState {
  @override
  final List<TodoModel> todos;

  TodoAddState({
    required this.todos,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAddState &&
          runtimeType == other.runtimeType &&
          todos == other.todos;

  @override
  int get hashCode => todos.hashCode;
}

// delete todo state
class TodoDeleteState extends TodoState {
  @override
  final List<TodoModel> todos;

  TodoDeleteState({
    required this.todos,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoDeleteState &&
          runtimeType == other.runtimeType &&
          todos == other.todos;

  @override
  int get hashCode => todos.hashCode;
}

// update todo state
class TodoUpdateState extends TodoState {
  @override
  final List<TodoModel> todos;

  TodoUpdateState({
    required this.todos,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoUpdateState &&
          runtimeType == other.runtimeType &&
          todos == other.todos;

  @override
  int get hashCode => todos.hashCode;
}

class TodoUpdateButtonPressedState extends TodoState {
  @override
  final List<TodoModel> todos;

  TodoUpdateButtonPressedState({
    required this.todos,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoUpdateButtonPressedState &&
          runtimeType == other.runtimeType &&
          todos == other.todos;

  @override
  int get hashCode => todos.hashCode;
}
