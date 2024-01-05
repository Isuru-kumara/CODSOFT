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
      ToDo(id: '01', todoText: 'Complete the project proposal', isDone: true),
      ToDo(id: '02', todoText: 'Go for a 30-minute walk', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Read a chapter of a book',
      ),
      ToDo(
        id: '04',
        todoText: 'Call a friend or family member',
      ),
      ToDo(
        id: '05',
        todoText: 'Organize your desk/workspace',
      ),
      ToDo(
        id: '06',
        todoText: 'Learn a new recipe and cook a meal',
      ),
      ToDo(id: '07', todoText: 'Write a to-do list for the week'),
      ToDo(id: '08', todoText: 'Practice mindfulness or meditation'),
      ToDo(id: '09', todoText: 'Attend a virtual event or webinar'),
      ToDo(id: '10', todoText: 'Start a new hobby or learn a new skill'),
    ];
  }
}
