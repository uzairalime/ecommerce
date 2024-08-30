import 'dart:developer';

import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/circle_btn.dart';
import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  final producttitle;
  final productVarient;
  final productPrice;
  final productQty;
  final productImage;
  int? productitems;
  bool? ischecked;

  CartCard({
    super.key,
    this.producttitle,
    this.productVarient,
    this.productPrice,
    this.productQty,
    this.productImage,
    this.productitems,
    this.ischecked,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool isChecked = false;
  int items = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    int qty = items;

    // items;

    return SizedBox(
      width: width,
      height: 100,
      child: Row(
        children: [
          // check box
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
              activeColor: AppColor().primary,
            ),
          ),
          const SizedBox(width: 10),
          // Cart Product image
          Image.asset(
            widget.productImage,
            width: width * 0.2,
            height: height * 0.1,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 15),
          // Cart Product details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Text(
                widget.producttitle,
                style: blackTextStyle(16, weight: FontWeight.w500),
              ),
              // varient
              Text(
                "Varient: ${widget.productVarient}",
                style: greyTextStyle(14),
              ),
              // Spacer(),
              const SizedBox(height: 15),
              // price and qty add , delete and remove button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // price and qty
                  Text("Price: \$ ${widget.productPrice}",
                      style: blackTextStyle(14, weight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  // qty
                  Text("Qty: ${qty}", style: greyTextStyle(14)),
                  const SizedBox(width: 25),
                  // Spacer(),
                  // add and remove button
                  // subtract button
                  CircleBtn(
                    icon: Icons.remove,
                    onTap: () {
                      if (items > 0) {
                        setState(() {
                          items--;
                        });
                      }
                      log("decrement");
                    },
                  ),
                  const SizedBox(width: 5),
                  Text(items.toString(),
                      style: blackTextStyle(18, weight: FontWeight.w600)),
                  const SizedBox(width: 5),
                  // add button
                  CircleBtn(
                    icon: Icons.add,
                    onTap: () {
                      if (items >= 0) {
                        setState(() {
                          items++;
                        });
                      }
                      log("increment");
                    },
                  ),
                  const SizedBox(width: 8),
                  // delete button
                  CircleBtn(
                    icon: Icons.delete_outline_outlined,
                    onTap: () => log("Delete"),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
