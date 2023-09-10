import 'dart:async';

import 'package:fluxxer/action/action.dart';

class Dispatcher {
  Dispatcher._internal();
  static final Dispatcher _instance = Dispatcher._internal();
  factory Dispatcher() => _instance;

  final StreamController<Action> _controller = StreamController<Action>.broadcast();
  Stream<Action> get stream => _controller.stream.asBroadcastStream();

  void dispatch(Action action) {
    _controller.sink.add(action);
  }
}
