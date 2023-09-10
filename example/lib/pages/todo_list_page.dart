import 'package:example/action_creators/todo_list_action_creators.dart';
import 'package:example/repository/fake/fake_list_repository.dart';
import 'package:example/stores/todo_list_store.dart';
import 'package:flutter/material.dart';
import 'package:fluxxer/view/flux_view.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final store = TodoListStore();
  final actionCreator = TodoListActionCreator(FakeListRepository());

  @override
  void initState() {
    super.initState();
    actionCreator.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: _TodoListSection(
        store: store,
        actionCreator: actionCreator,
      ),
    );
  }
}

class _TodoListSection extends StatelessWidget {
  const _TodoListSection({
    Key? key,
    required this.store,
    required this.actionCreator,
  }) : super(key: key);

  final TodoListStore store;
  final TodoListActionCreator actionCreator;

  @override
  Widget build(BuildContext context) {
    return FluxView(
      store: store,
      builder: (context, snapshot) {
        if (!snapshot.hasData && !snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.todos.length,
            itemBuilder: (context, index) {
              final todo = snapshot.data!.todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: Checkbox(
                  value: todo.completed,
                  onChanged: (value) {
                    if (value == true) {
                      actionCreator.completeTodo(todoId: todo.id);
                    } else {
                      actionCreator.incompleteTodo(todoId: todo.id);
                    }
                  },
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No data'),
          );
        }
      },
    );
  }
}
