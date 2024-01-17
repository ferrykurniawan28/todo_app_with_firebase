class ToDoItem {
  String title;
  String description;
  DateTime date;
  String priority;
  bool done;

  ToDoItem(this.title, this.done, this.description, this.date, this.priority);

  // ToDoItem.fromJson(Map<String, dynamic> json)
  //     : title = json['title'],
  //       done = json['done'];

  // Map<String, dynamic> toJson() => {
  //   'title': title,
  //   'done': done,
  // };
}
