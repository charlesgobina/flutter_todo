import 'package:caasi_todo/features/todo/domain/bloc/todo_bloc.dart';
import 'package:caasi_todo/features/todo/presentation/home/widgets/modal_popup.dart';
import 'package:caasi_todo/features/todo/presentation/home/widgets/update_modal_popup.dart';
import 'package:caasi_todo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caasi Todo', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: const [
          Icon(Icons.calendar_month_rounded, color: Colors.white)
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoAddState) {
            if (state.todos.isEmpty) {
              return const Center(
                child: Text('No Todo'),
              );
            }
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.todos[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0)),
                                const SizedBox(height: 5.0),
                                Text(state.todos[index].description,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    )),
                                const SizedBox(height: 10.0),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Text(state.todos[index].category,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.0)),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(state.todos[index].date,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10.0)),
                                    ]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PopupMenuButton<String>(
                                  onSelected: (String choice) {
                                    // Handle menu item selection here
                                    if (choice == 'Edit') {
                                      // Handle Edit action
                                      context
                                          .read<TodoBloc>()
                                          .add(TodoUpdateButtonPressedEvent());
                                      TodoUpdatePopup todoUpdatePopup =
                                          TodoUpdatePopup(
                                              todoBloc:
                                                  context.read<TodoBloc>(),
                                              index: index);
                                      todoUpdatePopup
                                          .showTextFieldPopup(context);
                                    } else if (choice == 'Delete') {
                                      // Handle Delete action
                                      context
                                          .read<TodoBloc>()
                                          .add(TodoDeleteEvent(index: index));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                        value: 'Edit',
                                        child: Text('Edit'),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'Delete',
                                        child: Text('Delete'),
                                      ),
                                    ];
                                  },
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                );
              },
            );
          } else if (state is TodoAtRestState) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.todos[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0)),
                                const SizedBox(height: 5.0),
                                Text(state.todos[index].description,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    )),
                                const SizedBox(height: 10.0),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Text(state.todos[index].category,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.0)),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(state.todos[index].date,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10.0)),
                                    ]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PopupMenuButton<String>(
                                  onSelected: (String choice) {
                                    // Handle menu item selection here
                                    if (choice == 'Edit') {
                                      // Handle Edit action
                                      context
                                          .read<TodoBloc>()
                                          .add(TodoUpdateButtonPressedEvent());
                                      TodoUpdatePopup todoUpdatePopup =
                                          TodoUpdatePopup(
                                              todoBloc:
                                                  context.read<TodoBloc>(),
                                              index: index);
                                      todoUpdatePopup
                                          .showTextFieldPopup(context);
                                    } else if (choice == 'Delete') {
                                      // Handle Delete action
                                      context
                                          .read<TodoBloc>()
                                          .add(TodoDeleteEvent(index: index));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                        value: 'Edit',
                                        child: Text('Edit'),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'Delete',
                                        child: Text('Delete'),
                                      ),
                                    ];
                                  },
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                );
              },
            );
          } else if (state is TodoUpdateState) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.todos[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0)),
                                const SizedBox(height: 5.0),
                                Text(state.todos[index].description,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    )),
                                const SizedBox(height: 10.0),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Text(state.todos[index].category,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.0)),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(state.todos[index].date,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10.0)),
                                    ]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PopupMenuButton<String>(
                                  onSelected: (String choice) {
                                    // Handle menu item selection here
                                    if (choice == 'Edit') {
                                      // Handle Edit action
                                      context
                                          .read<TodoBloc>()
                                          .add(TodoUpdateButtonPressedEvent());
                                      TodoUpdatePopup todoUpdatePopup =
                                          TodoUpdatePopup(
                                              todoBloc:
                                                  context.read<TodoBloc>(),
                                              index: index);
                                      todoUpdatePopup
                                          .showTextFieldPopup(context);
                                    } else if (choice == 'Delete') {
                                      // Handle Delete action
                                      context
                                          .read<TodoBloc>()
                                          .add(TodoDeleteEvent(index: index));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                        value: 'Edit',
                                        child: Text('Edit'),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'Delete',
                                        child: Text('Delete'),
                                      ),
                                    ];
                                  },
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Todo'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // instantiate the todo popup
          TodoPopup todoPopup = TodoPopup(todoBloc: context.read<TodoBloc>());
          // Show the custom modal pop-up when the FAB is clicked
          todoPopup.showTextFieldPopup(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.blue,
          ),
          child: Container(
            height: 60,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.book_outlined),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.tag_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
