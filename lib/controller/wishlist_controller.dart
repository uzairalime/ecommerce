// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/model/product_model.dart';
// import 'package:get/get.dart';

// class WishlistController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   var wishList = [].obs;
//   // RxBool isInWishList = false.obs;

//   void addToWishList(product) {
//     wishList.add(product);
//   }
//   void removeFromWishList(product) {
//     wishList.remove(product);
//   }
//   // void checkWishList(product) {
//   //   isInWishList.value = wishList.contains(product);
//   // }
  

//   bool isInWishList(ProductModel product) {
//     return wishList.contains(product);
//   }
  
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  final  _firestore = FirebaseFirestore.instance;
  var wishList = [].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchWishlist();
  }
  void fetchWishlist() async {
    try {
      var snapshot = await _firestore.collection('wishlist').get();
      var products = snapshot.docs.map((doc) {
        var data = doc.data();
        return ProductModel.fromJson(data); // Ensure you have a method to convert from Firestore data
      }).toList();
      wishList.assignAll(products);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch wishlist');
    }
  }
  // Add a product to the wishlist
  void addToWishList(ProductModel product) async {
    try {
      await _firestore.collection('wishlist').doc().set(product.toJson());
      wishList.add(product);
      Get.snackbar('Success', 'Product added to wishlist');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add product to wishlist');
    }
  }
  // Remove a product from the wishlist
  void removeFromWishList(ProductModel product) async {
    try {
      await _firestore.collection('wishlist').doc(product.id.toString()).delete();
      wishList.remove(product);
      Get.snackbar('Removed', 'Product removed from wishlist');
    } catch (e) {
      Get.snackbar('Error', 'Failed to remove product from wishlist');
    }
  }
  // Check if a product is in the wishlist
  bool isInWishList(ProductModel product) {
    return wishList.any((item) => item.id == product.id);
  }
  
}

