import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/todo/todo_bloc.dart';
import 'package:learn_bloc/asif%20learn%20bloc/todo/todo_event.dart';
import 'package:learn_bloc/asif%20learn%20bloc/todo/todo_state.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state.todoList.isEmpty) {
          return const Center(
            child: Text("No Todo Found !"),
          );
        } else if (state.todoList.isNotEmpty) {
          return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .read<TodoBloc>()
                            .add(RemoveTodoEvent(task: state.todoList[index]));
                      },
                      icon: const Icon(Icons.delete)),
                );
              });
        } else {
          return const SizedBox();
        }
      })),
      floatingActionButton: FloatingActionButton(onPressed: () {
        for (int i = 0; i < 5; i++) {
          context.read<TodoBloc>().add(AddTodoEvent(task: 'task : $i'));
        }
      }),
    );
  }
}
