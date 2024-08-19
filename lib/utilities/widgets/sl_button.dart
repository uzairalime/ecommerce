import 'dart:developer';

import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';

class SlButton extends StatelessWidget {
  final text;
  final textColor;
  final bgBtnColor;
  final widthbtn;
  VoidCallback? onTap;
  SlButton(
      {super.key,
      required this.text,
      this.textColor,
      this.bgBtnColor,
      required this.onTap,
      this.widthbtn});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      width: widthbtn ?? width * 0.5,
      height: height * 0.06,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgBtnColor ?? AppColor().primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextButton(
        onPressed: () {
          onTap!();
        },
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontFamily: 'Inter'),
        ),
      ),
    );
  }
}
