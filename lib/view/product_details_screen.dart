import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/follow_btn.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:ecommerce/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final WishlistController _wishlistController = Get.find();
  // bool heartClicked = false;
  bool followClicked = false;

  final ProductModel product = Get.arguments;

  // bool get isInWishlist => null;

  // final Model product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    // bool isInWishList = _wishlistController.isInWishList(product);
    return Scaffold(
        appBar: AppBar(
          // back screen button
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          // title Screen
          title: Text(
            "Product Details",
            style: blackTextStyle(18, weight: FontWeight.w500),
          ),
          centerTitle: true,
          // Cart Icon
          actions: [
            // cart icon
            NotificationIcon(
                icon: Icons.shopping_cart_outlined,
                onTap: () => log("Cart"),
                num: 2),
            const SizedBox(width: 10),
          ],
        ),
        // body
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              Container(
                  color: Colors.white,
                  child: Image.network(
                    product.image,
                    width: width,
                    height: height * 0.4,
                  )),
              // product name and price and heart icon
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // full title price and heart icon section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // product name and price
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // product name
                              SizedBox(
                                width: width * 0.8,
                                child: Text(product.title,
                                    style: blackTextStyle(18,
                                            weight: FontWeight.w500)
                                        .copyWith(
                                            overflow: TextOverflow.visible)),
                              ),
                              // price and people buy this
                              Row(
                                children: [
                                  Text(
                                    "\$" + product.price.toString(),
                                    style: blackTextStyle(20,
                                        weight: FontWeight.w500),
                                  ),
                                  Text(
                                    "( " + "10" + "people buy this )",
                                    style: greyTextStyle(16,
                                        weight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              //
                            ],
                          ),
                          // heart icon
                          Obx(() => InkWell(
                              onTap: () {
                                if (_wishlistController.isInWishList(product)) {
                                  _wishlistController.removeFromWishList(product);
                                  // log(_wishlistController.isInWishList(product).toString());
                                } else {
                                  log("===== pr $product");

                                  _wishlistController.addToWishList(product);
                                  // log(_wishlistController.isInWishList(product).toString());
                                  
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    _wishlistController.isInWishList(product)
                                        ? Icons.heart_broken
                                        : Icons.heart_broken_outlined,
                                    size: 30,
                                    color: _wishlistController.isInWishList(product)
                                        ? AppColor().primary
                                        : AppColor().secondaryGrey,
                                  )),
                            ),
                          )
                          // 
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        // width: width*0.3,

                        // height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          product.category,
                          style: greyTextStyle(16, weight: FontWeight.w500)
                              .copyWith(
                            color: AppColor().primary,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      // color title
                      Text(
                        "Choose the color",
                        style: greyTextStyle(16),
                      ),
                      const SizedBox(height: 10),
                      // color section
                      Row(
                        children: [
                          // color 1
                          Container(
                            width: width * 0.2,
                            height: 50,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(245, 227, 223, 1),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          //
                        ],
                      ),
                      //
                      const SizedBox(height: 7),
                      // divider
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      const SizedBox(height: 5),
                      // store content container
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // store logo
                          Image.asset(
                            'assets/images/apple_logo.png',
                            width: 50,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // title and time
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // store title
                              Text(
                                'Apple Store',
                                style: blackTextStyle(18),
                              ),
                              // store online time
                              Text(
                                "online" + "12" + "mins ago",
                                style: greyTextStyle(14),
                              )
                            ],
                          ),
                          const Spacer(),
                          // follow button
                          FollowBtn(
                            name: "Follow",
                            bgcolor: followClicked ? AppColor().primary : null,
                            onTap: () {
                              setState(() {
                                followClicked = !followClicked;
                              });
                            },
                          ),
                          //
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      // description title
                      Text(
                        "Description",
                        // productCardList[index].desscription,
                        style: blackTextStyle(18, weight: FontWeight.w500),
                      ),
                      Text(
                        product.description,
                        style: blackTextStyle(14),
                      )
                    ]),
              ),
            ],
          ),
        ),
        // bottom navigation bar
        bottomNavigationBar: Container(
          width: width,
          height: height * 0.1,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Add to Cart button
              SlButton(
                text: "Add to Cart",
                onTap: () => log("Add to Cart"),
                widthbtn: width * 0.4,
              ),
              // Buy Now button
              SlButton(
                text: "Buy Now",
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const CartScreen();
                })),
                textColor: Colors.black,
                bgBtnColor: AppColor().greyColor,
                widthbtn: width * 0.4,
              ),
            ],
          ),
        ));
  }
}
