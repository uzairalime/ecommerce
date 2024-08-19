import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.red,
            width: 40,
            height: 40,
            child: Text(
              "Account",
            )),
      ),
    );
  }
}
