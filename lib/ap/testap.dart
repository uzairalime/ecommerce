// import 'dart:developer';

// import 'package:ecommerce/controller/product_get_controller.dart';
// import 'package:ecommerce/utilities/colors.dart';
// import 'package:ecommerce/utilities/widgets/sl_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Testap extends StatefulWidget {
//   const Testap({super.key});

//   @override
//   State<Testap> createState() => _TestapState();
// }

// class _TestapState extends State<Testap> {
//   final ProductGetController _productGetController =
//       Get.put(ProductGetController());

//   @override
//   void initState() {
//     // TODO: implement initState
//     _productGetController.getProducts();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Text("data", style: TextStyle(fontSize: 20)),
//             Expanded(child: Obx(
//               () {
//                 if (_productGetController.isloading.value) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 return GridView.builder(
//                   shrinkWrap: true,
//                   // physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       childAspectRatio: 2 / 3,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10),
//                   itemCount: _productGetController.productList.length,
//                   itemBuilder: (context, index) {
//                     final model = _productGetController.productList[index];
//                     return Container(
//                       width: width * 0.43,
//                       decoration: BoxDecoration(
//                         color: const Color.fromRGBO(250, 250, 252, 1),
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             // spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: const Offset(0, 3),
//                             // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Product Image
//                           Image.network(
//                             model.image.toString(),
//                             width: width * 0.5,
//                             height: height * 0.2,
//                             fit: BoxFit.contain,
//                           ),

//                           // Product Details
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // title
//                                 Text(
//                                   model.title.toString(),
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: 'Inter',
//                                     overflow: TextOverflow.ellipsis,
//                                     color: AppColor().secondary,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 3),
//                                 // price
//                                 Text(model.price.toString(),
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600,
//                                         fontFamily: 'Inter',
//                                         overflow: TextOverflow.ellipsis,
//                                         color: AppColor().secondary)),
//                                 const SizedBox(height: 3),
//                                 // btn add to card
//                                 SlButton(
//                                     widthbtn: width * 0.43,
//                                     text: 'Add to Cart',
//                                     onTap: () {
//                                       // onTap;
//                                       log("Product");
//                                     }),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
