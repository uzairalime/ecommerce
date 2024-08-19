import 'dart:developer';

import 'package:coolicons/coolicons.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/lists/product_card_list.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/search_text_field.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/carousel_slid.dart';
import 'package:ecommerce/utilities/widgets/categry_card.dart';
import 'package:ecommerce/utilities/widgets/filter_btn.dart';
import 'package:ecommerce/utilities/widgets/product_card.dart';
import 'package:ecommerce/view/search_product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // ignore: unused_local_variable
    final height = MediaQuery.sizeOf(context).height;
    String selectedLocation = 'Salatiga City, Central Java';

    return Scaffold(
      // App bar
      appBar: AppBar(
        // Delivery address
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // address
            Text(
              "Delivery address",
              style: greyTextStyle(12),
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
        // cart and notification icon
        actions: [
          // cart icon
          NotificationIcon(
            icon: Icons.shopping_cart_outlined,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchProductScreen();
              }));
            },
            num: 2,
          ),
          // notification icon
          NotificationIcon(
            icon: Icons.notifications_none_outlined,
            onTap: () => log("Notification"),
            num: 2,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search text field
              SearchTextField(
                hint: "Search here ...",
                w: width,
                // width: width,
                // label: "Search",
              ),
              // banner slider
              const CarouselSlid(),
              const SizedBox(height: 7),
              // category text
              Text(
                'Category',
                style: blackTextStyle(16, weight: FontWeight.w500),
              ),
              const SizedBox(height: 7),
              // category card
              SizedBox(
                width: width,
                height: 100,
                // color: Colors.red,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return CategryCard(
                      title: categoryList[index].name!,
                      icon: categoryList[index].image!,
                    );
                  },
                ),
              ),
              // Recent product text and filter btn
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Products',
                    style: blackTextStyle(16, weight: FontWeight.w500),
                  ),
                  // filter btn
                  FilterBtn(
                    name: "Filter",
                    icon: Coolicons.filter_outline,
                    onTap: () {
                      log("Filter");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 7),
              // recent product
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
      // buttom Navigation Bar
    );
  }
}
