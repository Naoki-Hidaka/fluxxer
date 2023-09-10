import 'package:fluxxer/action/action.dart';
import 'package:fluxxer/dispatcher/dispatcher.dart';

abstract class ActionCreator<T extends Action> {
  final Dispatcher _dispatcher = Dispatcher();

  void dispatch(T action) {
    _dispatcher.dispatch(action);
  }
}
