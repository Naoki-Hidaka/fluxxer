import 'package:example/model/todo.dart';
import 'package:fluxxer/action/action.dart';

sealed class TodoListAction extends Action {}

class Initialize extends TodoListAction {
  Initialize(this.todos);

  final List<Todo> todos;
}

class Add extends TodoListAction {
  Add(this.todo);

  final Todo todo;
}

class Remove extends TodoListAction {
  Remove(this.todoId);

  final int todoId;
}

class Complete extends TodoListAction {
  Complete(this.todoId);

  final int todoId;
}

class Incomplete extends TodoListAction {
  Incomplete(this.todoId);

  final int todoId;
}

class Refresh extends TodoListAction {
  Refresh(this.todos);

  final List<Todo> todos;
}

class LoadMore extends TodoListAction {
  LoadMore(this.todos);

  final List<Todo> todos;
}

class Error extends TodoListAction {
  Error(this.exception);

  final Exception exception;
}
