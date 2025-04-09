import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_node/logics/get_todo_cubit/get_todo_cubit.dart';
import 'package:todo_with_node/pages/todo_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<GetTodoCubit>().getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      body: BlocBuilder<GetTodoCubit, GetTodoState>(
        builder: (context, state) {
          if (state is GetTodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing:
                      todo.completed ? Icon(Icons.check) : Icon(Icons.close),
                );
              },
            );
          } else if (state is GetTodoFailure) {
            return Center(child: Text(state.msg));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => TodoFormPage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
