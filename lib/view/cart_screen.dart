import 'dart:developer';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/cart_item_card.dart';
import 'package:ecommerce/utilities/widgets/circle_btn.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
import 'package:ecommerce/view/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // final CartlistController cartlistController = Get.find();
  final CartlistController cartlistController = Get.put(CartlistController());



  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    String selectedLocation = 'Salatiga City, Central Java';
    int qty = 1;
    int items = 0;
    // RxInt subtotal = ,

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
              Obx(() => Expanded(
                child: cartlistController.checkCarthaveproduct() ? Center(child: Text("No Product in the Cart", style: blackTextStyle(16),)) : ListView.builder(
                  itemCount: cartlistController.cartList.length,
                  itemBuilder: (context, index) {
                    final product = cartlistController.cartList[index];

                //     final price = product.price.toString();
                //     final qty = cartlistController.items.value;
                //     final subtotal =
                    
                //      product.price * qty;
                // //  cartlistController.setSubtotal(subtotal);
                  cartlistController.setTotalItmePrice(cartlistController.items.value, product.price);



                    return Obx(() => CartItemCard(
                      image: product.image.toString(),
                      title: product.title.toString(),
                      price:cartlistController. subtotal.value,
                      qty: cartlistController.items.value, 
                      // delete product
                      onTapDelete: (){
                        cartlistController.removeFromCart(product);
                      },
                      // add qty
                      onTapAdd: (){
                        // log(product.price.value* qty.toDouble());
                        cartlistController.incrementQty();
                        log("price subtotal ${cartlistController.subtotal.value.toString()}");
                        log(" price product ${product.price.toString()}");
                      },
                      // substract qty
                      onTapSub: (){
                        cartlistController.decrementQty();
                      },
                    ),);
                },),
              ),),
              // Cart Card
              const SizedBox(height: 20)
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
              // Total price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Totals",
                        style: blackTextStyle(16, weight: FontWeight.w500)),
                    Text("\$ 500", style: blackTextStyle(16)),
                    // Obx(() => Text("\$ 500", style: blackTextStyle(16)),)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Checkout button
              SlButton(
                  text: "Continue for payments" ,
                  onTap: () {

                    Get.to(CheckoutScreen());
                  },
                  widthbtn: width * 0.9,
                  bgBtnColor:
                      cartlistController.checkCarthaveproduct() ? AppColor().greyColor : AppColor().primary,
                  textColor: cartlistController.checkCarthaveproduct() ? Colors.black : Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
