import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
  final title;
  final subtitle;
  final price;
  void Function()? onTap;

  DeliveryCard({super.key, this.title, this.subtitle, this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width * 0.9,
        height: height * 0.1,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: AppColor().greyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: blackTextStyle(16, weight: FontWeight.w500)),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 5,
                ),
                Text(subtitle,
                    style: blackTextStyle(14, weight: FontWeight.w400)),
              ],
            ),
            Text(price, style: blackTextStyle(16, weight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
