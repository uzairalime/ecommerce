import 'package:flutter/material.dart';

class ProductCardModel {
  final img;
  final title;
  final price;
  VoidCallback? onTap;

  ProductCardModel(this.img, this.title, this.price, this.onTap);
}
