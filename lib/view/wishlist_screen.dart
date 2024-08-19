import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.red,
            width: 40,
            height: 40,
            child: Text(
              "Whislist",
            )),
      ),
    );
  }
}
