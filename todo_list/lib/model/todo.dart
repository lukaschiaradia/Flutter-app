class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Sport', isDone: true ),
      ToDo(id: '02', todoText: 'Travail', isDone: true ),
      ToDo(id: '03', todoText: 'Rdv EIP', ),
      ToDo(id: '04', todoText: 'Pizza time', ),
      ToDo(id: '05', todoText: 'Evaluation image processing', ),
      ToDo(id: '06', todoText: 'Faire à manger', ),
    ];
  }
}