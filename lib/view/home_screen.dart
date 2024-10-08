import 'dart:developer';
import 'package:coolicons/coolicons.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/product_get_controller.dart';
import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/notification_icon.dart';
import 'package:ecommerce/utilities/search_text_field.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/carousel_slid.dart';
import 'package:ecommerce/utilities/widgets/categry_card.dart';
import 'package:ecommerce/utilities/widgets/filter_btn.dart';
import 'package:ecommerce/utilities/widgets/product_card.dart';
import 'package:ecommerce/view/authorization/login_screen.dart';
import 'package:ecommerce/view/cart_screen.dart';
import 'package:ecommerce/view/product_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductGetController _productGetController =
      Get.put(ProductGetController());
  final WishlistController wishlistController = Get.put(WishlistController());
  final CartlistController cartlistController = Get.put(CartlistController());
  // final WishlistController _wishlistController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // ignore: unused_local_variable
    final height = MediaQuery.sizeOf(context).height;
    String selectedLocation = 'Salatiga City, Central Java';
    _productGetController.getProducts();
    // _productGetController.getProductsByCategory("electronics");
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
                return const CartScreen();
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
          // logout icon
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then(
                  (value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                );
              },
              icon: const Icon(Icons.logout))
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
              const SizedBox(height: 10),
              // product categries
              SizedBox(
                  height: height * 0.05,
                  width: width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _productGetController.categoryProductList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _productGetController.getFilteredProducts(
                              _productGetController.categoryProductList[index]);
                          _productGetController.selectedIndex.value = index;
                          // log("messag e${_productGetController.selectedIndex.value}");
                        },
                        child: Obx(
                          () => Container(
                            height: height * 0.05,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.05, vertical: 5),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color:
                                  _productGetController.selectedIndex.value ==
                                          index
                                      ? AppColor().primary
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColor().secondary),
                            ),
                            child: Text(_productGetController
                                .categoryProductList[index]
                                .toString()),
                          ),
                        ),
                      );
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              // ---------------------------------------------------------------------
              // recent product
              Obx(
                () {
                  if (_productGetController.isloading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3.1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: _productGetController.filteredProductList.length,
                    itemBuilder: (context, index) {
                      final model =
                          _productGetController.filteredProductList[index];
                      return ProductCard(
                          title: model.title.toString(),
                          price: model.price.toString(),
                          onTap: () =>
                              Get.to(ProductDetailsScreen(), arguments: model),
                          img: model.image.toString());
                    },
                  );
                },
              ),

              // -----------------------------------------------------------------------------
            ],
          ),
        ),
      ),
      // buttom Navigation Bar
    );
  }
}
