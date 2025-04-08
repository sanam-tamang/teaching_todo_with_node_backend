import 'package:flutter/material.dart';

class FlutterToast {
  static Future<void> showToast(BuildContext context, {required String msg}) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
