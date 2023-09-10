import 'package:fluxxer/action/action.dart';
import 'package:fluxxer/dispatcher/dispatcher.dart';

abstract class ActionCreator<T extends Action> {
  ActionCreator(this._dispatcher);
  final Dispatcher _dispatcher;

  void dispatch(T action) {
    _dispatcher.dispatch(action);
  }
}
