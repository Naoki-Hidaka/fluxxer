class Todo {
  const Todo({
    required this.id,
    required this.title,
    required this.completed,
    required this.createdAt,
  });

  final int id;
  final String title;
  final bool completed;
  final DateTime createdAt;
}
