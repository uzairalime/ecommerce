// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/widgets.dart';

class FilterBtn extends StatelessWidget {
  String name;
  IconData? icon;
  Function() onTap;
  FilterBtn({
    Key? key,
    required this.name,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            // color: Colors.grey[200],
            border: Border.all(color: AppColor().secondaryGrey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: blackTextStyle(14),
              ),
              SizedBox(width: 5),
              Icon(
                icon,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
