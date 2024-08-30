import 'dart:developer';
import 'package:coolicons/coolicons.dart';
import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/filter_btn.dart';
import 'package:ecommerce/utilities/widgets/product_card.dart';
import 'package:ecommerce/view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});
  final WishlistController _wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
              Obx(
                () {
                  // if (_wishlistController.wishList[index].isloading.value) {
                  //   return const Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3.1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: _wishlistController.wishList.length,
                    itemBuilder: (context, index) {
                      final model =_wishlistController.wishList[index];
                      return ProductCard(
                          title: model.title.toString(),
                          price: model.price.toString(),
                          onTap: () => Get.to(ProductDetailsScreen(), arguments: model),
                          img: model.image.toString());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
