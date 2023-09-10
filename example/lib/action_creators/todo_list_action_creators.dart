import 'package:example/actions/todo_list_action.dart';
import 'package:example/repository/todo_list_repository.dart';
import 'package:fluxxer/action_creator/action_creator.dart';

class TodoListActionCreator extends ActionCreator<TodoListAction> {
  TodoListActionCreator(this._todoListRepository);

  final TodoListRepository _todoListRepository;

  Future<void> initialize() async {
    print('initialize');
    try {
      final todos = await _todoListRepository.getTodos();
      dispatch(Initialize(todos));
    } on Exception catch (e) {
      dispatch(Error(e));
    }
  }

  Future<void> addTodo({required String title}) async {
    try {
      final todo = await _todoListRepository.addTodo(title: title);
      dispatch(Add(todo));
    } on Exception catch (e) {
      dispatch(Error(e));
    }
  }

  Future<void> removeTodo({required int todoId}) async {
    try {
      await _todoListRepository.removeTodo(todoId: todoId);
      dispatch(Remove(todoId));
    } on Exception catch (e) {
      dispatch(Error(e));
    }
  }

  Future<void> completeTodo({required int todoId}) async {
    try {
      await _todoListRepository.completeTodo(todoId: todoId);
      dispatch(Complete(todoId));
    } on Exception catch (e) {
      dispatch(Error(e));
    }
  }

  Future<void> incompleteTodo({required int todoId}) async {
    try {
      await _todoListRepository.incompleteTodo(todoId: todoId);
      dispatch(Incomplete(todoId));
    } on Exception catch (e) {
      dispatch(Error(e));
    }
  }

  Future<void> refresh() async {
    try {
      final todos = await _todoListRepository.getTodos();
      dispatch(Refresh(todos));
    } on Exception catch (e) {
      dispatch(Error(e));
    }
  }

  Future<void> loadMore() async {
    try {
      final todos = await _todoListRepository.getTodos();
      dispatch(LoadMore(todos));
    } on Exception catch (e) {
      dispatch(Error(e));
    }
  }
}
