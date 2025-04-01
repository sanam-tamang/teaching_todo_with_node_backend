import 'package:flutter/material.dart';
import 'package:todo_with_node/config/color_pallet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello world",
          style: TextStyle(fontSize: 40, color: ColorPallet.mainColor),
        ),
      ),
    );
  }
}
