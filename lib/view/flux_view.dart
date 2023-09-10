import 'package:flutter/material.dart';
import 'package:fluxxer/store/store.dart';
import 'package:fluxxer/store/state.dart' as flux;

class FluxView extends StatelessWidget {
  const FluxView({
    super.key,
    required this.store,
    required this.builder,
  });

  final Store store;
  final Widget Function(BuildContext context, AsyncSnapshot<flux.State> snapshot) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<flux.State>(
      stream: store.stream,
      builder: (BuildContext context, AsyncSnapshot<flux.State> snapshot) {
        return builder(context, snapshot);
      },
    );
  }
}
