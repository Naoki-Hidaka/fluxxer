import 'package:example/model/todo.dart';
import 'package:example/repository/todo_list_repository.dart';

class FakeListRepository implements TodoListRepository {
  final _todo = <Todo>[
    Todo(
      id: 0,
      title: 'Todo 1',
      completed: false,
      createdAt: DateTime.now(),
    ),
    Todo(
      id: 1,
      title: 'Todo 2',
      completed: false,
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Future<List<Todo>> getTodos() {
    print('getTodos');
    return Future.value(_todo);
  }

  @override
  Future<Todo> addTodo({required String title}) {
    final todo = Todo(
      id: _todo.length,
      title: title,
      completed: false,
      createdAt: DateTime.now(),
    );
    _todo.add(todo);
    return Future.value(todo);
  }

  @override
  Future<void> completeTodo({required int todoId}) async {
    final todo = _todo[todoId];
    final updatedTodo = Todo(
      id: todo.id,
      title: todo.title,
      completed: true,
      createdAt: todo.createdAt,
    );
    _todo[todoId] = updatedTodo;
    return Future.value();
  }

  @override
  Future<void> incompleteTodo({required int todoId}) {
    final todo = _todo[todoId];
    final updatedTodo = Todo(
      id: todo.id,
      title: todo.title,
      completed: false,
      createdAt: todo.createdAt,
    );
    _todo[todoId] = updatedTodo;
    return Future.value();
  }

  @override
  Future<int> removeTodo({required int todoId}) {
    _todo.removeAt(todoId);
    return Future.value(todoId);
  }
}
