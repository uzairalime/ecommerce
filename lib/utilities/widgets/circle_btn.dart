import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';

class CircleBtn extends StatelessWidget {
  final icon;
  final onTap;
  const CircleBtn({super.key, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 20,
          height: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: AppColor().secondary),
          ),
          child: Icon(
            icon,
            size: 12,
            color: AppColor().secondary,
          )),
    );
  }
}
