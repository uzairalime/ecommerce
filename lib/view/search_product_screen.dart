import 'dart:developer';

import 'package:coolicons/coolicons.dart';
import 'package:ecommerce/utilities/lists/product_card_list.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/search_text_field.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/filter_btn.dart';
import 'package:ecommerce/utilities/widgets/product_card.dart';
import 'package:ecommerce/view/product_details_screen.dart';
import 'package:flutter/material.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const SearchTextField(),
        actions: [
          NotificationIcon(
            icon: Icons.shopping_cart_outlined,
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return  ProductDetailsScreen();
            })),
            num: 2,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // search result text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // search result text
                  Text("Search result for “Earphone”",
                      style: blackTextStyle(16)),
                  // filter button
                  FilterBtn(
                    name: "Filter",
                    icon: Coolicons.filter_outline,
                    onTap: () {
                      log("Filter");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // product list
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: productCardList.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    // list from product_card_list.dart
                    img: productCardList[index].img,
                    title: productCardList[index].title,
                    price: productCardList[index].price,
                    onTap: productCardList[index].onTap,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
