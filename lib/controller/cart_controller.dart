import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:get/get.dart';

class CartlistController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  var cartList = [].obs;
  RxInt items = 1.obs;
  RxDouble subtotal = 0.0.obs;

  setSubtotal(value) {
    subtotal.value = value;
    log("subtotal $subtotal");
  }

  setTotalItmePrice(quentity, price) {
    subtotal.value = quentity * price;
    log("subtotal $subtotal");
  }

  @override
  void onInit() {
    super.onInit();
    fetchCartList();
  }
  // fetching cart list from firestore

  Future<void> fetchCartList() async {
    try {
      var snapshot = await _firestore.collection("cart").get();
      var product = snapshot.docs.map((doc) {
        var data = doc.data();
        return ProductModel.fromJson(data);
      }).toList;
    } catch (e) {
      Get.snackbar("error Failed to fetch cart list", e.toString());
    }
  }

  // Add a product to the cart
  void addtoCart(ProductModel product) async {
    try {
      await _firestore.collection("cart").add(product.toJson());
      cartList.add(product);
      Get.snackbar("Congrats", "Product added to cart");
    } catch (e) {
      Get.snackbar("errro to add product in cart", e.toString());
    }
  }

  // Remove a product from the cart
  void removeFromCart(ProductModel product) async {
    try {
      await _firestore.collection("cart").doc(product.id.toString()).delete();
      cartList.remove(product);
      Get.snackbar("Success", "Product removed from cart");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Check if a product is in the cart
  bool isInCart(ProductModel product) {
    return cartList.contains(product);
  }

  // clear the cart
  bool checkCarthaveproduct() {
    return cartList.isEmpty;
  }
  // Increment the quantity of a product in the cart

  void incrementQty() {
    if (items >= 1) {
      items.value++;
    }
  }

  // Decrement the quantity of a product in the cart
  void decrementQty() {
    if (items.value >= 2) {
      items.value--;
    }
    // update();
  }

  // Calculate the total price of the products in the cart
  // void calculateTotal() {
  //   total.value = 0;
  //   for (var product in cartList) {
  //     total.value += product.price * items.value;
  //   }
  // }
}
