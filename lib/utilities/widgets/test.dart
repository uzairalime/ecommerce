import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        'assets/images/banner_1.png',
        width: width,
        // height: height * 0.3,
        fit: BoxFit.cover,
      ),
    );
  }
}
