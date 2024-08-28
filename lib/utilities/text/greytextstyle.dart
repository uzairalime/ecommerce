import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// GreyTextStyle
TextStyle greyTextStyle(double? size, {FontWeight? weight}) {
  return GoogleFonts.inter(
    fontSize: size ?? 14,
    color: AppColor().secondaryGrey,
    fontWeight: weight ?? FontWeight.w400,
  );
}

// blackfieldtext
TextStyle blackTextStyle(double? size, {FontWeight? weight}) {
  return GoogleFonts.inter(
    
    fontSize: size ?? 14,
    color: AppColor().secondary,
    fontWeight: weight ?? FontWeight.w400,
  );
}

// header text
TextStyle labelTextStyle(double? size, {FontWeight? weight}) {
  return GoogleFonts.inter(
    fontSize: size ?? 18,
    color: AppColor().secondary,
    fontWeight: weight ?? FontWeight.w600,
  );
}
