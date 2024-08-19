import 'dart:developer';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/follow_btn.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:ecommerce/view/cart_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool heartClicked = false;
  bool followClicked = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
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
              Image.asset('assets/images/product_img.png'),
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
                              Text("Air pods max by Apple",
                                  style: blackTextStyle(18,
                                      weight: FontWeight.w500)),
                              // price and people buy this
                              Row(
                                children: [
                                  Text(
                                    "\$ 1999,99",
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
                          InkWell(
                            onTap: () {
                              setState(() {
                                heartClicked = !heartClicked;
                              });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  heartClicked
                                      ? Icons.heart_broken_outlined
                                      : Icons.heart_broken,
                                  size: 30,
                                  color: heartClicked
                                      ? AppColor().secondaryGrey
                                      : AppColor().primary,
                                )
                                // IconButton(
                                //     onPressed: () {
                                //       setState(() {
                                //         heartClicked = !heartClicked;
                                //       });
                                //     },
                                //     icon: Icon(
                                //       Icons.heart_broken_outlined,
                                //       size: 30,
                                //       color: heartClicked
                                //           ? AppColor().secondaryGrey
                                //           : AppColor().primary,
                                //     )),
                                ),
                          )
                          //
                        ],
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
                            width: 90,
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
                        "data",
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
