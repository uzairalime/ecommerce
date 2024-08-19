import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:flutter/material.dart';

class CartCheckoutCard extends StatefulWidget {
  final producttitle;
  final productVarient;
  final productPrice;
  final productQty;
  final productImage;
  int? productitems;
  bool? ischecked;

  CartCheckoutCard({
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
  State<CartCheckoutCard> createState() => _CartCheckoutCardState();
}

class _CartCheckoutCardState extends State<CartCheckoutCard> {
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
      height: height * 0.11,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 20),
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
                  const SizedBox(width: 40),
                  // qty
                  Text("${qty} quantity", style: greyTextStyle(14)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
