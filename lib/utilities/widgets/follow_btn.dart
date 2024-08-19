// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/widgets.dart';

class FollowBtn extends StatelessWidget {
  String name;
  Color? bgcolor;
  Function() onTap;
  FollowBtn({
    Key? key,
    required this.name,
    this.bgcolor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          // color: Colors.grey[200],
          color: bgcolor,
          border: Border.all(color: AppColor().greyColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          name,
          style: blackTextStyle(14),
        ),
      ),
    );
  }
}
