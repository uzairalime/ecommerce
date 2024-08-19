import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategryCard extends StatelessWidget {
  final String title;
  final String icon;
  final bgcolor;
  void Function()? onTap;
  CategryCard(
      {super.key,
      required this.title,
      required this.icon,
      this.onTap,
      this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              // color: Color.fromRGBO(237, 247, 255, 1),
              color: bgcolor ?? AppColor().bgcategrey,
              borderRadius: BorderRadius.circular(10),
            ),
            // child: SvgPicture.asset(icon),
            child: Image.asset(icon, fit: BoxFit.fill),
          ),
          const SizedBox(height: 8),
          Text(title, style: greyTextStyle(13)),
        ],
      ),
    );
  }
}
