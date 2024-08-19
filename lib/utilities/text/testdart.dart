import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/fashion.svg'),
        SvgPicture.asset('assets/icons/Buy.svg'),
        Icon(Coolicons.Figma)
      ],
    )));
  }
}
