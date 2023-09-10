import 'package:flutter/material.dart';
import 'package:fluxxer/store/store.dart';
import 'package:fluxxer/store/state.dart' as flux_state;
import 'package:fluxxer/action/action.dart' as flux_action;
import 'package:fluxxer/action_creator/action_creator.dart';

class FluxView<T extends flux_state.State, A extends flux_action.Action, AC extends ActionCreator>
    extends StatelessWidget {
  const FluxView({
    super.key,
    required this.store,
    required this.builder,
  });

  final Store<T, A, AC> store;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: store.stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        return builder(context, snapshot);
      },
    );
  }
}
