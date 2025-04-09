
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_node/logics/get_todo_cubit/get_todo_cubit.dart';
import 'package:todo_with_node/logics/todo_cubit/todo_cubit.dart';

class TodoFormPage extends StatefulWidget {
  const TodoFormPage({super.key});

  @override
  State<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> {
  final TextEditingController _titleController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Todo"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter todo title",
                fillColor: Colors.grey.shade300,
                filled: true,
              ),
            ),
          ),

          SizedBox(height: 16),
          BlocConsumer<TodoCubit, TodoState>(
            listener: (context, state) {
              if (state is TodoLoaded) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.msg)));

                context.read<GetTodoCubit>().getTodos();

                ///refetching vairako xa haii
                Navigator.of(context).pop();
              } else if (state is TodoFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.msg)));
              }
            },
            builder: (context, state) {
              return state is TodoLoading
                  ? CircularProgressIndicator()
                  : FilledButton(
                    onPressed: () {
                      context.read<TodoCubit>().createTodo(
                        title: _titleController.text,
                      );
                    },
                    child: Text("Save"),
                  );
            },
          ),
        ],
      ),
    );
  }
}
