// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:ecommerce/utilities/colors.dart';

class NotificationIcon extends StatelessWidget {
  final num;
  final IconData icon;
  void Function()? onTap;
  NotificationIcon({
    Key? key,
    required this.icon,
    this.onTap,
    this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text(num.toString()),
      alignment: Alignment(0.3, -0.5),
      child: IconButton(
        icon: Icon(
          // Coolicons.bell,
          icon,
          color: AppColor().secondary,
          // size: 20,
        ),
        onPressed: onTap,
      ),
    );
  }
}
