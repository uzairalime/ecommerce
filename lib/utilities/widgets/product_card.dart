import 'dart:developer';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final img;
  final title;
  final price;
  VoidCallback? onTap;
  ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.onTap,
      required this.img});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.43,
        height: Get.height * 0.3,
        
        decoration: BoxDecoration(
          color: const Color.fromRGBO(250, 250, 252, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              // spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
              // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.network(
              img,
              // model.image.toString(),
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
      
            // Product Details
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // title
                  Text(
                    title,
                    // model.title.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      overflow: TextOverflow.ellipsis,
                      color: AppColor().secondary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  // price
                  Text("\$ $price",
                      // model.price.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          overflow: TextOverflow.ellipsis,
                          color: AppColor().secondary)),
                  const SizedBox(height: 3),
                  // btn add to card
                  SlButton(
                      widthbtn: width * 0.43,
                      text: 'Add to Cart',
                      onTap: () {
                        // onTap;

                        log("Product");
                      //   Obx(() => SlButton(
                      //   widthbtn: width * 0.43,
                      //   text: _cartlistController.isInCart(product)
                      //       ? "Add to Cart"
                      //       : "Remove from Cart",
                      //   onTap: () {
                      //     if (_cartlistController.isInCart(product)) {
                      //       log("add to cart btn from card ");
                      //       _cartlistController.removeFromCart(product);
                      //     } else {
                      //       _cartlistController.addtoCart(product);
                      //       log("remove from cart btn");
                      //     }
                      //     log("${_cartlistController.isInCart(product)}");
                      //   },
                      // ))
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
