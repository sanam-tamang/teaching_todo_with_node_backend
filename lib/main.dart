import 'package:flutter/material.dart';
import 'package:todo_with_node/config/color_pallet.dart';
import 'package:todo_with_node/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPallet.mainColor),
      ),
      home: const SignUpPage(),
    );
  }
}
