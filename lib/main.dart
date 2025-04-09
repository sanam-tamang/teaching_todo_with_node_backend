import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_node/config/color_pallet.dart';
import 'package:todo_with_node/logics/auth_cubit/auth_cubit.dart';
import 'package:todo_with_node/logics/get_todo_cubit/get_todo_cubit.dart';
import 'package:todo_with_node/logics/todo_cubit/todo_cubit.dart';
import 'package:todo_with_node/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => TodoCubit()),
        BlocProvider(create: (context) => GetTodoCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorPallet.mainColor),
        ),
        home: const SignUpPage(),
      ),
    );
  }
}
