import 'dart:developer';

import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/text_field_custom.dart';
import 'package:ecommerce/utilities/widgets/cart_checkout_card.dart';
import 'package:ecommerce/utilities/widgets/delivery_card.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:ecommerce/view/payment_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isChecked = false;
  int items = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    String selectedLocation = 'Salatiga City, Central Java';

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
          "Checkouts",
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
      //
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Divider(color: AppColor().greyColor, thickness: 1),
          // Delivery address
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              // text
              Text(
                "Delivery to",
                style: blackTextStyle(14, weight: FontWeight.w500),
              ),
              const Spacer(),
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
              const SizedBox(
                width: 10,
              ),
              //
            ],
          ),
          Divider(color: AppColor().greyColor, thickness: 1),
          const SizedBox(height: 20),
          // Cart Product
          CartCheckoutCard(
            productImage: "assets/images/product_img.png",
            producttitle: "Air Pods max by Apple",
            productVarient: "Black",
            productPrice: "${1200}",
            productQty: items.toString(),
          ),
          Spacer(),

          // Delivery Option & bottom Sheet
          TextFieldCustom(
            hint: "Select the delivery option",
            icon: Icons.arrow_forward_ios_rounded,
            widthField: width * 0.9,
            onTap: () {
              // bottom sheet
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select the Delivery",
                              style:
                                  blackTextStyle(16, weight: FontWeight.w500),
                            ),
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close))
                          ],
                        ),
                        DeliveryCard(
                          title: "Express",
                          subtitle: "1 - 3 days delivery",
                          price: "\$ 500",
                          onTap: () => log("Express Delivery"),
                        ),
                        const SizedBox(height: 10),
                        DeliveryCard(
                          title: "Regular",
                          subtitle: "1 - 3 days delivery",
                          price: "\$ 500",
                          onTap: () => log("Regular Delivery"),
                        ),
                        const SizedBox(height: 10),
                        DeliveryCard(
                          title: "Cargo",
                          subtitle: "1 - 3 days delivery",
                          price: "\$ 500",
                          onTap: () => log("Cargo Delivery"),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
              // return
            },
          ),

          // Apply Discount
          TextFieldCustom(
            hint: "Apply Discount",
            icon: Icons.arrow_forward_ios_rounded,
            widthField: width * 0.9,
            onTap: () {
              // bottom sheet discount list
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select the Discount",
                              style:
                                  blackTextStyle(16, weight: FontWeight.w500),
                            ),
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close))
                          ],
                        ),
                        DeliveryCard(
                          title: "Discount 10%",
                          subtitle: "1 - 3 days delivery",
                          price: "up to \$ 500",
                          onTap: () => log("Discount"),
                        ),
                        const SizedBox(height: 10),
                        DeliveryCard(
                          title: "20%",
                          subtitle: "1 - 3 days delivery",
                          price: "up to \$ 500",
                          onTap: () => log("Discount"),
                        ),
                        const SizedBox(height: 10),
                        DeliveryCard(
                          title: "30%",
                          subtitle: "1 - 3 days delivery",
                          price: "up to \$ 500",
                          onTap: () => log("Discount"),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
              // return
            },
          ),
          //
        ],
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
                text: "Select Payment Method",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                widthbtn: width * 0.9,
                bgBtnColor:
                    isChecked ? AppColor().primary : AppColor().greyColor,
                textColor: isChecked ? Colors.white : Colors.black),
          ],
        ),
      ),
      //
    );
  }
}
