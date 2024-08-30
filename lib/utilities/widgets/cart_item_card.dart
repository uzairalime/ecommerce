import 'dart:developer';

import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/circle_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCard extends StatelessWidget {
  final title;
  final price;
  final image;
  final qty;
  late Function onTapDelete;
  late Function onTapAdd;
  late Function onTapSub;

  CartItemCard({super.key, this.title, this.price, this.image,required this.onTapDelete,required this.onTapAdd,required this.onTapSub, this.qty});
  final CartlistController cartlistController = Get.put(CartlistController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    // int qty = 1;
   // int items = 0;
    bool isChecked = false;
    return Container(
      width: Get.width*0.9,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: Get.height * 0.015),
      child: Row(
        children: [
          // check box
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                // setState(() {
                //   isChecked = value!;
                // });
              },
              activeColor: AppColor().primary,
            ),
          ),
          const SizedBox(width: 10),
          // Cart Product image
          Image.network(
            image,
            width: width * 0.2,
            height: height * 0.1,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          // Cart Product details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              SizedBox(
                width: width * 0.5,
                child: Text(
                  title,
                  overflow: TextOverflow.visible,
                  style: blackTextStyle(15, weight: FontWeight.w500),
                ),
              ),
              // varient
              Text(
                "Varient: Black",
                style: greyTextStyle(14),
              ),
              // Spacer(),
              const SizedBox(height: 15),
              // price and qty add , delete and remove button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // price and qty
                  Text("Price: \$ $price",
                      style: blackTextStyle(14, weight: FontWeight.w500)),
                   SizedBox(width: Get.width * 0.02),
                  // qty
                  Text("Qty: $qty", style: greyTextStyle(14)),
                   SizedBox(width: Get.width * 0.06),
                  // add and remove button
                  // subtract button
                  CircleBtn(
                    icon: Icons.remove,
                    onTap: onTapSub,
                  ),
                   SizedBox(width: Get.width * 0.01),
                  Text(qty.toString(),
                      style: blackTextStyle(18, weight: FontWeight.w600)),
                   SizedBox(width: Get.width * 0.01),
                  // add button
                  CircleBtn(
                    icon: Icons.add,
                    onTap: (){
                      onTapAdd();

                      cartlistController.setTotalItmePrice(qty,price);
                    },
                  ),
                   SizedBox(width: Get.width * 0.02),
                  // delete button
                  CircleBtn(
                    icon: Icons.delete_outline_outlined,
                    onTap: onTapDelete ,
                  ),
                  // Obx(() => CircleBtn(
                  //   icon: Icons.delete_outline_outlined,
                  //   onTap: () {
                  //     log("Delete");
                  //     if (cartlistController.isInCart(product)) {
                  //   log("add to cart btn ");
                  //   cartlistController.removeFromCart(product);
                    
                  // } else {
                  //   cartlistController.addtoCart(product);
                  //   log("remove from cart btn");
                  // }
                  // log("${cartlistController.isInCart(product)}");
                  //   },
                  // ),)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
