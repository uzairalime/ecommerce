import 'dart:developer';

import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/circle_btn.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:ecommerce/view/checkout_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    String selectedLocation = 'Salatiga City, Central Java';
    int qty = 1;
    int items = 0;

    return SafeArea(
      child: Scaffold(
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
            "Your Cart",
            style: blackTextStyle(18, weight: FontWeight.w500),
          ),
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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Divider(color: AppColor().greyColor, thickness: 1),
              // Delivery address
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // text
                  Text(
                    "Delivery to",
                    style: blackTextStyle(14, weight: FontWeight.w500),
                  ),
                  // location name
                  DropdownButton(
                    value: selectedLocation,
                    style: blackTextStyle(14),
                    iconEnabledColor: AppColor().secondary,
                    underline: const SizedBox.shrink(),
                    items: <String>[
                      'Salatiga City, Central Java',
                      'Semarang City, Central Java',
                      'Yogyakarta City, Yogyakarta'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value.toString();
                      });
                    },
                  ),
                  //
                ],
              ),
              Divider(color: AppColor().greyColor, thickness: 1),
              const SizedBox(height: 20),
              // Cart Card
              Row(
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
                    'assets/images/product_img.png',
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
                        "Air pods max by Apple",
                        style: blackTextStyle(16, weight: FontWeight.w500),
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
                          Text("Price: \$ 500",
                              style:
                                  blackTextStyle(14, weight: FontWeight.w500)),
                          const SizedBox(width: 10),
                          // qty
                          Text("Qty: ${qty}", style: greyTextStyle(14)),
                          const SizedBox(width: 40),
                          // add and remove button
                          // subtract button
                          CircleBtn(
                            icon: Icons.remove,
                            onTap: () => log("subtract"),
                          ),
                          const SizedBox(width: 5),
                          Text(items.toString(),
                              style:
                                  blackTextStyle(18, weight: FontWeight.w600)),
                          const SizedBox(width: 5),
                          // add button
                          CircleBtn(
                            icon: Icons.add,
                            onTap: () => log("add"),
                          ),
                          const SizedBox(width: 10),
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
              //
            ],
          ),
        ),
        // Bottom Navigation
        bottomNavigationBar: SizedBox(
          height: height * 0.15,
          child: Column(
            children: [
              Divider(
                color: AppColor().greyColor,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Totals",
                        style: blackTextStyle(16, weight: FontWeight.w500)),
                    Text("\$ 500", style: blackTextStyle(16)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Checkout button
              SlButton(
                  text: "Continue for payments",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CheckoutScreen();
                    }));
                  },
                  widthbtn: width * 0.9,
                  bgBtnColor:
                      isChecked ? AppColor().primary : AppColor().greyColor,
                  textColor: isChecked ? Colors.white : Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
