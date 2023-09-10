import 'package:example/action_creators/todo_list_action_creators.dart';
import 'package:example/actions/todo_list_action.dart';
import 'package:example/model/todo.dart';
import 'package:fluxxer/store/state.dart';
import 'package:fluxxer/store/store.dart';

class TodoListStore extends Store<TodoListState, TodoListAction, TodoListActionCreator> {
  TodoListStore() : super(initialState: TodoListState(todos: []));

  @override
  TodoListState reduce(TodoListState currentState, TodoListAction action) {
    switch (action) {
      case Initialize(todos: final todos):
        return TodoListState(todos: todos);
      case Add(todo: final todo):
        return TodoListState(todos: [...currentState.todos, todo]);
      case Remove(todoId: final todoId):
        return TodoListState(todos: currentState.todos.where((todo) => todo.id != todoId).toList());
      case Complete(todoId: final todoId):
        return TodoListState(
          todos: currentState.todos
              .map(
                (todo) => todo.id == todoId
                    ? Todo(
                        id: todo.id,
                        title: todo.title,
                        completed: true,
                        createdAt: todo.createdAt,
                      )
                    : todo,
              )
              .toList(),
        );
      case Incomplete(todoId: final todoId):
        return TodoListState(
          todos: currentState.todos
              .map(
                (todo) => todo.id == todoId
                    ? Todo(
                        id: todo.id,
                        title: todo.title,
                        completed: false,
                        createdAt: todo.createdAt,
                      )
                    : todo,
              )
              .toList(),
        );
      case Refresh(todos: final todos):
        return TodoListState(todos: todos);
      case LoadMore(todos: final todos):
        return TodoListState(todos: [...currentState.todos, ...todos]);
      case Error(exception: final exception):
        return TodoListState(todos: currentState.todos, exception: exception);
    }
  }
}

class TodoListState extends State {
  TodoListState({
    required this.todos,
    this.exception,
  });

  final List<Todo> todos;
  final Exception? exception;
}
