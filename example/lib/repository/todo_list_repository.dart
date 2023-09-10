import 'package:example/model/todo.dart';

abstract interface class TodoListRepository {
  Future<List<Todo>> getTodos() => throw UnimplementedError();

  Future<Todo> addTodo({required String title}) => throw UnimplementedError();

  Future<int> removeTodo({required int todoId}) => throw UnimplementedError();

  Future<void> completeTodo({required int todoId}) => throw UnimplementedError();

  Future<void> incompleteTodo({required int todoId}) => throw UnimplementedError();
}
