import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.red,
            width: 40,
            height: 40,
            child: Text(
              "History",
            )),
      ),
    );
  }
}
