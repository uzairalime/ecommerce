import 'dart:developer';

import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/text_field_custom.dart';
import 'package:ecommerce/utilities/widgets/delivery_card.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        // App Bar
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
            "Payment Method",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // select existing card
                TextFieldCustom(
                  label: "Select Existing Card",
                  hint: "Enter Card Number",
                  icon: Icons.credit_card_outlined,
                  widthField: width,
                ),
                Divider(color: Colors.grey, thickness: 1),
                // or input new card details
                Text(
                  "Or Input New Card Details,",
                  style: blackTextStyle(16, weight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                // card number
                TextFieldCustom(
                  label: "Card Number",
                  hint: "Enter Card Number",
                  icon: Icons.credit_card_outlined,
                  widthField: width,
                ),
                // expiry date and cvv
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldCustom(
                      label: "Expire Date",
                      hint: "mm/yy",
                      widthField: width * 0.45,
                    ),
                    TextFieldCustom(
                      label: "CVV",
                      hint: "Enter CVV",
                      widthField: width * 0.45,
                    ),
                  ],
                ),
                // Card Holder Name
                TextFieldCustom(
                  label: "Card Holder Name",
                  hint: "Enter Card Holder Name",
                  widthField: width,
                ),
                //
              ],
            ),
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
                  text: "Select Payment Method",
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(Icons.close))
                                ],
                              ),
                              Text("Congrats! Your Order is successful",
                                  style: blackTextStyle(24,
                                      weight: FontWeight.w600)),
                              Text("data data data data data data data data",
                                  style: greyTextStyle(16)),
                              TextFieldCustom(
                                // label: "Order Number",
                                hint: "Order Invoice",
                                icon: Icons.download,
                                widthField: width,
                              ),
                              const SizedBox(height: 10),
                              SlButton(
                                text: "Continue",
                                onTap: () => log("Order"),
                                widthbtn: width,
                              ),
                            ],
                          ),
                        );
                      },
                    );
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
      ),
    );
  }
}
