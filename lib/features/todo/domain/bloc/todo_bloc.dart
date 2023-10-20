import 'package:bloc/bloc.dart';
import 'package:caasi_todo/features/todo/model/todo_model.dart';
import 'package:caasi_todo/main.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoAddEvent>(_onTodoAddEvent);
    on<TodoDeleteEvent>(_onTodoDeleteEvent);
    on<TodoUpdateEvent>(_onTodoUpdateEvent);
    on<TodoUpdateButtonPressedEvent>(_onTodoUpdateButtonPressedEvent);
    on<TodoInitialEvent>(_onTodoInitialEvent);
  }

  Future<void> _onTodoInitialEvent(
    TodoInitialEvent event,
    Emitter<TodoState> emit,
  ) async {
    List<TodoModel> allTodos = List.from(state.todos);

    // Emit a new TodoUpdateState with the updated todos list
    emit(TodoAtRestState(todos: allTodos));
  }

  Future<void> _onTodoAddEvent(
    TodoAddEvent event,
    Emitter<TodoState> emit,
  ) async {
    List<TodoModel> updatedTodos = List.from(state.todos)
      ..add(TodoModel(
          title: event.title,
          description: event.description,
          date: event.time,
          category: event.category,
          isDone: event.isDone));

    // parse date in the format of yyyy-MM-dd

    // update the date in the updatedTodos list

    // Emit a new TodoAddState with the updated todos list
    emit(TodoAddState(todos: updatedTodos));
  }

  Future<void> _onTodoDeleteEvent(
    TodoDeleteEvent event,
    Emitter<TodoState> emit,
  ) async {
    List<TodoModel> updatedTodos = List.from(state.todos)
      ..removeAt(event.index);

    // Emit a new TodoDeleteState with the updated todos list
    emit(TodoAddState(todos: updatedTodos));
  }

  Future<void> _onTodoUpdateEvent(
    TodoUpdateEvent event,
    Emitter<TodoState> emit,
  ) async {
    List<TodoModel> updatedTodos = List.from(state.todos)
      ..removeAt(event.index)
      ..insert(
          event.index,
          TodoModel(
              title: event.title,
              description: event.description,
              date: event.time,
              category: event.category,
              isDone: event.isDone));

    // Emit a new TodoUpdateState with the updated todos list
    emit(TodoAddState(todos: updatedTodos));
  }

  Future<void> _onTodoUpdateButtonPressedEvent(
    TodoUpdateButtonPressedEvent event,
    Emitter<TodoState> emit,
  ) async {
    List<TodoModel> updatedTodos = List.from(state.todos);

    // Emit a new TodoUpdateState with the updated todos list
    emit(TodoUpdateButtonPressedState(todos: updatedTodos));
  }
}
