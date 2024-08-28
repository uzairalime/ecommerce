import 'dart:developer';
import 'package:coolicons/coolicons.dart';
import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/utilities/widgets/filter_btn.dart';
import 'package:ecommerce/utilities/widgets/sl_button.dart';
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
                      return InkWell(
                        onTap: () {
                          Get.to( ProductDetailsScreen(), arguments: model);
                          
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return ProductDetailsScreen();
                              
                          //   },
                          // ));
                        },
                        child: Container(
                          width: width * 0.43,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 252, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                // spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                                // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              Image.network(
                                model.image.toString(),
                                width: width * 0.5,
                                height: height * 0.2,
                                fit: BoxFit.contain,
                              ),

                              // Product Details
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // title
                                    Text(
                                      model.title.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Inter',
                                        overflow: TextOverflow.ellipsis,
                                        color: AppColor().secondary,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    // price
                                    Text(model.price.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Inter',
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColor().secondary)),
                                    const SizedBox(height: 3),
                                    // btn add to card
                                    SlButton(
                                        widthbtn: width * 0.43,
                                        text: 'Add to Cart',
                                        onTap: () {
                                          // onTap;
                                          log("Product");
                                        }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
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
