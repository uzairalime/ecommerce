import 'package:flutter/material.dart';

import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';

class InputTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  // final dynamic keyboard;
  final TextInputType? keyboardtype;
  final IconData? icon;
  final IconData? preIcon;
  final widthField;
  void Function()? onTap;
  // final IconData? iconsecond;
  final TextEditingController? controller;
  InputTextField({
    Key? key,
    this.icon,
    this.preIcon,
    this.keyboardtype,
    this.label,
    this.hint,
    this.controller,
    this.widthField,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      width: widthField ?? width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // label text
          if (label != null) // Conditionally render the label
            Text(
              label!,
              style: labelTextStyle(18),
              textAlign: TextAlign.start,
            ),

          SizedBox(height: 10),
          // text field
          TextFormField(
            controller: controller,
            keyboardType: keyboardtype,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              hintText: hint,
              hintStyle: greyTextStyle(16),
              // prefix: Icon(preIcon),
              prefixIcon: InkWell(
                onTap: onTap,
                child: Icon(
                  preIcon,

                  // size: 20,
                ),
              ),
              // suffixIcon: InkWell(
              //   onTap: onTap,
              //   child: Icon(
              //     icon,
              //     // size: 20,
              //   ),
              // ),
              suffixIconColor: AppColor().secondaryGrey,
              prefixIconColor: AppColor().secondaryGrey,
              // main border
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor().secondaryGrey, width: 2),
              ),
              // active border
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor().secondary, width: 2),
              ),
              // error border
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor().error, width: 2),
              ),
              // active error border
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor().error, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor().greyColor, width: 2),
              ),
            ),
            // text style
            style: blackTextStyle(16, weight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
