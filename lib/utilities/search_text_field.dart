// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';

class SearchTextField extends StatelessWidget {
  final label;
  final hint;
  final IconData? icon;
  final w;
  // final IconData? iconsecond;
  final TextEditingController? controller;
  // Icons icons;
  const SearchTextField({
    Key? key,
    this.icon,
    // this.iconsecond,
    this.label,
    this.hint,
    this.controller,
    this.w,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // final height = MediaQuery.sizeOf(context).height;
    return Container(
      width: w ?? width,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10),
          // text field
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              hintText: hint ?? 'Search here...',
              hintStyle: greyTextStyle(16),
              prefixIcon: const Icon(
                Coolicons.search,
                size: 28,
              ),
              prefixIconColor: AppColor().secondaryGrey,

              // suffixStyle: ,
              // suffixIcon: icons ?? Icon(Icons.search),

              // main border
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor().secondaryGrey, width: 2),
              ),
              // enabled border
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: AppColor().textFieldColor, width: 2),
              ),
              // enabled: true,
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
              // active border
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor().error, width: 2),
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
