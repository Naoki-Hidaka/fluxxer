import 'dart:async';

import 'package:fluxxer/action/action.dart';
import 'package:fluxxer/action_creator/action_creator.dart';
import 'package:fluxxer/dispatcher/dispatcher.dart';
import 'package:fluxxer/store/state.dart';

abstract class Store<S extends State, A extends Action, AC extends ActionCreator> {
  Store() {
    _subscription = _dispatcher.stream.listen((action) {
      if (action is A) {
        _controller.sink.add(reduce(action));
      }
    });
  }

  final Dispatcher _dispatcher = Dispatcher();

  final StreamController<S> _controller = StreamController<S>();

  Stream<S> get stream => _controller.stream.asBroadcastStream();

  StreamSubscription? _subscription;

  S reduce(A action);

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _controller.close();
  }
}
