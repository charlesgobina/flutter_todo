part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoInitialEvent extends TodoEvent {}

class TodoAddEvent extends TodoEvent {
  final String title;
  final String description;
  final String time;
  final String category;
  final bool isDone;

  TodoAddEvent(
      {required this.title,
      required this.description,
      required this.time,
      required this.category,
      required this.isDone});
}

class TodoDeleteEvent extends TodoEvent {
  final int index;

  TodoDeleteEvent({required this.index});
}

class TodoUpdateButtonPressedEvent extends TodoEvent {}

class TodoUpdateEvent extends TodoEvent {
  final int index;
  final String title;
  final String description;
  final String time;
  var category;
  final bool isDone;

  TodoUpdateEvent(
      {required this.index,
      required this.title,
      required this.description,
      required this.time,
      required this.category,
      required this.isDone});
}
