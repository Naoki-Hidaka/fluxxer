import 'dart:ui';

import 'package:example/pages/todo_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  FlutterError.onError = (detail) {
    print(detail.exception);
    print(detail.stack);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    print(error);
    print(stack);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoListPage(),
    );
  }
}
