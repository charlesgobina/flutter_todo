import 'package:caasi_todo/features/todo/domain/bloc/todo_bloc.dart';
import 'package:caasi_todo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoUpdatePopup {
  // pass bloc to show popup
  final TodoBloc todoBloc;
  final int index;
  TodoUpdatePopup({required this.todoBloc, required this.index});

  Future<void> showTextFieldPopup(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return TextFieldUpdatePopupDialog(
          todoBloc: todoBloc,
          index: index,
        );
      },
    );
  }
}

class TextFieldUpdatePopupDialog extends StatefulWidget {
  final TodoBloc todoBloc;
  final int index;

  const TextFieldUpdatePopupDialog(
      {Key? key, required this.todoBloc, required this.index})
      : super(key: key);
  @override
  State<TextFieldUpdatePopupDialog> createState() =>
      _TextFieldUpdatePopupDialogState();
}

class _TextFieldUpdatePopupDialogState
    extends State<TextFieldUpdatePopupDialog> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  String _selectedItem = 'Work';

  // List of items for the dropdown
  final List<String> _dropdownItems = ['Work', 'Caasitech', 'Personal'];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      bloc: widget.todoBloc,
      builder: (context, state) {
        if (state is TodoUpdateButtonPressedState) {
          _titleController.text = state.todos[widget.index].title;
          _descriptionController.text = state.todos[widget.index].description;
          _dateController.text = state.todos[widget.index].date;
          _selectedItem = state.todos[widget.index].category;

          return AlertDialog(
            title: const Center(child: Text('Enter Text')),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  const Icon(Icons.list_alt_rounded),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                          hintText: "Title",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.list_alt_rounded),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                          hintText: "Description",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.list_alt_rounded),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                          hintText: "Title",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      onTap: () => _selectDate(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.tag_outlined),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedItem,
                      items: _dropdownItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? selectedItem) {
                        setState(() {
                          _selectedItem = selectedItem!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Select an option",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                ],
              ),

              // dropdown
            ]),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  widget.todoBloc.add(TodoInitialEvent());
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  String title = _titleController.text;
                  String desc = _descriptionController.text;
                  String date = _dateController.text;
                  String category = _selectedItem;

                  widget.todoBloc.add(TodoUpdateEvent(
                      index: widget.index,
                      title: title,
                      description: desc,
                      time: date,
                      category: category,
                      isDone: false));

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
