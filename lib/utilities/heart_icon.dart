// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:ecommerce/utilities/colors.dart';

class HeartIcon extends StatelessWidget {
  void Function() onTap;
  HeartIcon({
    Key? key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColor().secondaryGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.heart_broken_outlined,
            size: 35, color: AppColor().secondaryGrey),
      ),
    );
  }
}
