class TodoModel {
  String title;
  String description;
  String date;
  var category;
  bool isDone;

  DateTime now = DateTime.now();

  TodoModel(
      {required this.title,
      required this.description,
      required this.date,
      required this.category,
      required this.isDone});

  TodoModel copyWith({
    String? title,
    String? description,
    String? date,
    bool? isDone,
  }) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      category: category,
      isDone: isDone ?? this.isDone,
    );
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
