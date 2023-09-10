import 'dart:async';

import 'package:example/stores/todo_list_store.dart';
import 'package:fluxxer/action/action.dart';
import 'package:fluxxer/action_creator/action_creator.dart';
import 'package:fluxxer/dispatcher/dispatcher.dart';
import 'package:fluxxer/store/state.dart';

abstract class Store<S extends State, A extends Action, AC extends ActionCreator> {
  Store({required S initialState}) {
    _currentState = initialState;
    _controller.sink.add(initialState);
    _subscription = _dispatcher.stream.listen((action) {
      if (action is A) {
        _currentState = reduce(_currentState, action);
        _controller.sink.add(_currentState);
      }
    });
  }

  final Dispatcher _dispatcher = Dispatcher();

  final StreamController<S> _controller = StreamController<S>.broadcast();

  Stream<S> get stream => _controller.stream.asBroadcastStream();

  StreamSubscription? _subscription;

  late S _currentState;

  S reduce(S currentState, A action);

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _controller.close();
  }
}
